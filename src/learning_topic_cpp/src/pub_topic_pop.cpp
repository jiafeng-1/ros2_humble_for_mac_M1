/*
 * @Descripttion: 
 * @Author: Jia Feng
 * @version: 
 * @Date: 2023-11-19 11:50:01
 * @LastEditors: Jia Feng
 * @LastEditTime: 2023-11-20 21:59:13
 */

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"


int main(int argc, char *argv[])
{
    // init rclcpp
    rclcpp::init(argc, argv);
    // make Node
    auto node = std::make_shared<rclcpp::Node>("pub_topic_oop");
    // create publisher
    auto _publisher = node->create_publisher<std_msgs::msg::String>("topic_oop", 10);

    auto message = std_msgs::msg::String();
	message.data = "hello jiafeng, i am ros!!";

    for(;;)
    {
        _publisher->publish(message);
    }

    rclcpp::spin(node);
    return 0;
}