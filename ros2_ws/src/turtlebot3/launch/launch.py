import os
from launch import LaunchDescription
from launch.actions import ExecuteProcess
from ament_index_python.packages import get_package_share_directory

def generate_launch_description():
    # Path to the world files
    world_file_1 = os.path.join(get_package_share_directory('turtlebot3'), 'models', 'worlds', 'model.sdf')
    world_file_2 = os.path.join(get_package_share_directory('turtlebot3'), 'models', 'worlds', 'world_only.sdf')

    # Launch Ignition Gazebo with both worlds
    return LaunchDescription([
        # Launch the first world
        ExecuteProcess(
            cmd=['ign', 'gazebo', '-v', '4', world_file_1],
            output='screen'
        ),
        # Launch the second world
        ExecuteProcess(
            cmd=['ign', 'gazebo', '-v', '4', world_file_2],
            output='screen'
        ),
    ])
