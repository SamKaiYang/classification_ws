from Get_Image import rs_deproject_pixel2point
from Get_Image import depth_callback

magic_num = 0.035 #(meter)
point_a = [400, 300] # x, y
depth = rospy.subscribe(/camera/aligned_depth_to_color/image_raw) # subscribe

point_a_world = rs_deproject_pixel2point(point_a, depth) # [x, y, z] in meter ex:(0,0100332, 0,0100332, 0,0100332)

point_a_world_min = calculate_min(point_a_world)
point_a_world_max = calculate_max(point_a_world)

rospy.pub("/coordinate_limit_min", point_a_world_min)
rospy.pub("/coordinate_limit_max", point_a_world_max)

normal_vector_quat = rospy.sub(object_pose) # quaternion -> rotation matrix
normal_vector_rotation  = Eigen or AI_Bot/ROBOTICS/MATH_H quat2rotation (normal_vector_quat -> normal_vector_rotation)
# Transfomr to robot
rotation_matrix * 

def calculate_min(self, point):
    point.x = point.x - magic_num
    point.y = point.y - magic_num
    point.z = point.z - magic_num
    return point

def calculate_max(self, point):
    point.x = point.x + magic_num
    point.y = point.y + magic_num
    point.z = point.z + magic_num
    return point
