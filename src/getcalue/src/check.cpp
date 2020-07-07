#include <ros/ros.h>
#include <turtlesim/Pose.h> // For geometry_msgs::Twist

void Get_PoseMsg(const turtlesim::Pose& msg)
{
    if(msg.x){
	printf("got it\n");
	}
    else{
	printf("donot\n");
    }

}


int main ( int argc, char** argv ) 
{
	// Initialize the ROS system and become a node .
	ros::init ( argc, argv, "check" ) ;
	ros::NodeHandle nh ;
	
    // Create a subscriber 
    ros::Subscriber sub = nh.subscribe("", 1000, &Get_PoseMsg);

    // Let ROS spin in this node
    ros::spin();
}


// not complete yet
