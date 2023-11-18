#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

#if 0

int main(int argc, char *argv[])
{
    // 1. init rclcpp
    rclcpp::init(argc, argv);
    // 2. make node and node name
    auto node = std::make_shared<rclcpp::Node>("Node1");
    // 3. create publisher
    auto _publisher = node->create_publisher<std_msgs::msg::String>("publish_name", 10);
    // 4. create pub msg
    auto msg = std_msgs::msg::String();
    msg.data = "hello ros, my name is jiafeng";
    // 5. pub msg
    _publisher->publish(msg);
    // 6. print log
    RCLCPP_INFO(node->get_logger(),"pub msg : %s", msg.data.c_str());
    rclcpp::spin(node);
    rclcpp::shutdown();
    return 0;
}

#else

using namespace std::chrono_literals;

class MinimalPublisher : public rclcpp::Node
{
public:
    MinimalPublisher() : Node("minimal_publisher"), count_(0)
    {
        publisher_ = this->create_publisher<std_msgs::msg::String>("topic", 10);
        timer_ = this->create_wall_timer(
            500ms, std::bind(&MinimalPublisher::timer_callback, this));
    }
private:
    void timer_callback()
    {
        auto message = std_msgs::msg::String();
        message.data = "hello, world!" + std::to_string(count_++);
        RCLCPP_INFO(this->get_logger(), "Publishing: '%s", message.data.c_str());
        publisher_->publish(message);
    }
    rclcpp::TimerBase::SharedPtr timer_;
    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
    size_t count_;
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<MinimalPublisher>());
    rclcpp::shutdown();
    return 0;
}
#endif