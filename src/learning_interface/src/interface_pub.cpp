#include <chrono>
#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "learning_interface/msg/num.hpp"

using namespace std::chrono_literals;

class publisher : public rclcpp::Node
{
public:
    publisher() : Node("publisher"), _count(0)
    {
        _publisher = this->create_publisher<learning_interface::msg::Num>("topic", 10);
        _timer = this->create_wall_timer(500ms, std::bind(&publisher::timer_callback), this);
    }


private:
    void timer_callback()
    {
        
    }
    rclcpp::Publisher<learning_interface::msg::Num>::SharedPtr _publisher;
    rclcpp::TimerBase::SharedPtr _timer;
    size_t _count;
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    rclcpp::spin(std::make_shared<publisher>());
    rclcpp::shutdown();
    return 0;
}