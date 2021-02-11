def spawner(_name, _modelURI, _worldName, _x, _y, _z, _roll, _pitch, _yaw)
  <<-HEREDOC
    <spawn name="#{_name}">
      <name>#{_name}</name>
      <allow_renaming>false</allow_renaming>
      <pose>#{_x} #{_y} #{_z + 0.1} #{_roll} #{_pitch} #{_yaw}</pose>
      <world>#{_worldName}</world>
      <is_performer>true</is_performer>
      <sdf version='1.6'>
      <include>
        <name>#{_name}</name>
        <uri>#{_modelURI}</uri>
        <!-- Publish robot state information -->
        <plugin filename="libignition-gazebo-pose-publisher-system.so"
          name="ignition::gazebo::systems::PosePublisher">
          <publish_link_pose>true</publish_link_pose>
          <publish_sensor_pose>true</publish_sensor_pose>
          <publish_collision_pose>false</publish_collision_pose>
          <publish_visual_pose>false</publish_visual_pose>
          <publish_nested_model_pose>#{$enableGroundTruth}</publish_nested_model_pose>
          <use_pose_vector_msg>true</use_pose_vector_msg>
          <static_publisher>true</static_publisher>
          <static_update_frequency>60</static_update_frequency>
        </plugin>
        <plugin filename="libignition-gazebo-multicopter-motor-model-system.so"
          name="ignition::gazebo::systems::MulticopterMotorModel">
          <robotNamespace>model/#{_name}</robotNamespace>
          <jointName>ShBody_1_ShArm_1_joint</jointName>
          <linkName>ShArm_1_link</linkName>
          <turningDirection>ccw</turningDirection>
          <timeConstantUp>0.0125</timeConstantUp>
          <timeConstantDown>0.025</timeConstantDown>
          <maxRotVelocity>1</maxRotVelocity>
          <motorConstant>20</motorConstant>
          <momentConstant>0.06</momentConstant>
          <commandSubTopic>command/motor_speed</commandSubTopic>
          <motorNumber>0</motorNumber>
          <rotorDragCoefficient>0.000106428</rotorDragCoefficient>
          <rollingMomentCoefficient>0</rollingMomentCoefficient>
          <motorSpeedPubTopic>motor_speed/0</motorSpeedPubTopic>
          <rotorVelocitySlowdownSim>0.015</rotorVelocitySlowdownSim>
          <motorType>velocity</motorType>
        </plugin>
        <plugin filename="libignition-gazebo-multicopter-motor-model-system.so"
          name="ignition::gazebo::systems::MulticopterMotorModel">
          <robotNamespace>model/#{_name}</robotNamespace>
          <jointName>ShBody_1_ShArm_2_joint</jointName>
          <linkName>ShArm_2_link</linkName>
          <turningDirection>cw</turningDirection>
          <timeConstantUp>0.0125</timeConstantUp>
          <timeConstantDown>0.025</timeConstantDown>
          <maxRotVelocity>1</maxRotVelocity>
          <motorConstant>20</motorConstant>
          <momentConstant>0.06</momentConstant>
          <commandSubTopic>command/motor_speed</commandSubTopic>
          <motorNumber>1</motorNumber>
          <rotorDragCoefficient>0.000106428</rotorDragCoefficient>
          <rollingMomentCoefficient>0</rollingMomentCoefficient>
          <motorSpeedPubTopic>motor_speed/1</motorSpeedPubTopic>
          <rotorVelocitySlowdownSim>0.015</rotorVelocitySlowdownSim>
          <motorType>velocity</motorType>
        </plugin>
        <plugin filename="libignition-gazebo-multicopter-motor-model-system.so"
          name="ignition::gazebo::systems::MulticopterMotorModel">
          <robotNamespace>model/#{_name}</robotNamespace>
          <jointName>ShBody_1_ShArm_3_joint</jointName>
          <linkName>ShArm_3_link</linkName>
          <turningDirection>ccw</turningDirection>
          <timeConstantUp>0.0125</timeConstantUp>
          <timeConstantDown>0.025</timeConstantDown>
          <maxRotVelocity>1</maxRotVelocity>
          <motorConstant>20</motorConstant>
          <momentConstant>0.06</momentConstant>
          <commandSubTopic>command/motor_speed</commandSubTopic>
          <motorNumber>2</motorNumber>
          <rotorDragCoefficient>0.000106428</rotorDragCoefficient>
          <rollingMomentCoefficient>0</rollingMomentCoefficient>
          <motorSpeedPubTopic>motor_speed/2</motorSpeedPubTopic>
          <rotorVelocitySlowdownSim>0.015</rotorVelocitySlowdownSim>
          <motorType>velocity</motorType>
        </plugin>
        <plugin filename="libignition-gazebo-multicopter-motor-model-system.so"
          name="ignition::gazebo::systems::MulticopterMotorModel">
          <robotNamespace>model/#{_name}</robotNamespace>
          <jointName>ShBody_1_ShArm_4_joint</jointName>
          <linkName>ShArm_4_link</linkName>
          <turningDirection>cw</turningDirection>
          <timeConstantUp>0.0125</timeConstantUp>
          <timeConstantDown>0.025</timeConstantDown>
          <maxRotVelocity>1</maxRotVelocity>
          <motorConstant>20</motorConstant>
          <momentConstant>0.06</momentConstant>
          <commandSubTopic>command/motor_speed</commandSubTopic>
          <motorNumber>3</motorNumber>
          <rotorDragCoefficient>0.000106428</rotorDragCoefficient>
          <rollingMomentCoefficient>0</rollingMomentCoefficient>
          <motorSpeedPubTopic>motor_speed/3</motorSpeedPubTopic>
          <rotorVelocitySlowdownSim>0.015</rotorVelocitySlowdownSim>
          <motorType>velocity</motorType>
        </plugin>
        <plugin
          filename="libignition-gazebo-multicopter-control-system.so"
          name="ignition::gazebo::systems::MulticopterVelocityControl">
          <robotNamespace>model/#{_name}</robotNamespace>
          <commandSubTopic>cmd_vel</commandSubTopic>
          <motorControlPubTopic>command/motor_speed</motorControlPubTopic>
          <enableSubTopic>velocity_controller/enable</enableSubTopic>
          <comLinkName>base_link</comLinkName>
          <velocityGain>15 15 15</velocityGain>
          <attitudeGain>7 7 7</attitudeGain>
          <angularRateGain>1.0 1.0 0.5</angularRateGain>
          <maximumLinearAcceleration>3.57 3.66 1.49</maximumLinearAcceleration>
          <maximumLinearVelocity>2.04 1.95 1.05</maximumLinearVelocity>
          <maximumAngularVelocity>5.02 4.55 3.60</maximumAngularVelocity>
          <linearVelocityNoiseMean>0 0 0.05</linearVelocityNoiseMean>
          <!-- linearVelocityNoiseStdDev based on error values reported in the paper Shen et. al., -->
          <!-- Vision-Based State Estimation and Trajectory Control Towards High-Speed Flight with a Quadrotor -->
          <!-- http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.490.7958&rep=rep1&type=pdf -->
          <linearVelocityNoiseStdDev>0.1105 0.1261 0.00947</linearVelocityNoiseStdDev>
          <angularVelocityNoiseMean>0 0 0</angularVelocityNoiseMean>
          <!-- angularVelocityNoiseStdDev values based on ADIS16448's Rate Noise Density with a sample  -->
          <!-- time of 0.004 ms. -->
          <angularVelocityNoiseStdDev>0.004 0.004 0.004</angularVelocityNoiseStdDev>

          <rotorConfiguration>
            <rotor>
              <jointName>ShBody_1_ShArm_1_joint</jointName>
              <forceConstant>20</forceConstant>
              <momentConstant>0.06</momentConstant>
              <direction>1</direction>
            </rotor>
            <rotor>
              <jointName>ShBody_1_ShArm_2_joint</jointName>
              <forceConstant>20</forceConstant>
              <momentConstant>0.06</momentConstant>
              <direction>-1</direction>
            </rotor>
            <rotor>
              <jointName>ShBody_1_ShArm_3_joint</jointName>
              <forceConstant>20</forceConstant>
              <momentConstant>0.06</momentConstant>
              <direction>1</direction>
            </rotor>
            <rotor>
              <jointName>ShBody_1_ShArm_4_joint</jointName>
              <forceConstant>20</forceConstant>
              <momentConstant>0.06</momentConstant>
              <direction>-1</direction>
            </rotor>
          </rotorConfiguration>
        </plugin>
        <!-- Battery plugin -->
        <plugin filename="libignition-gazebo-linearbatteryplugin-system.so"
          name="ignition::gazebo::systems::LinearBatteryPlugin">
          <battery_name>linear_battery</battery_name>
          <voltage>17.4</voltage>
          <open_circuit_voltage_constant_coef>17.4</open_circuit_voltage_constant_coef>
          <open_circuit_voltage_linear_coef>-3.1424</open_circuit_voltage_linear_coef>
          <initial_charge>50.0</initial_charge>
          <capacity>50.0</capacity>
          <resistance>0.061523</resistance>
          <smooth_current_tau>1.9499</smooth_current_tau>
          <power_load>51.5</power_load>
          <start_on_motion>true</start_on_motion>
        </plugin>
        <!-- Gas Detector plugin -->
        <plugin filename="libGasEmitterDetectorPlugin.so"
          name="subt::GasDetector">
          <topic>/model/#{_name}/gas_detected</topic>
          <update_rate>10</update_rate>
          <type>gas</type>
        </plugin>
        </include>
      </sdf>
    </spawn>

  HEREDOC
end

def rosExecutables(_name, _worldName)
  <<-HEREDOC
    <executable name='robot_description'>
      <command>roslaunch --wait costar_shafter_sensor_config_1 description.launch world_name:=#{_worldName} name:=#{_name}</command>
    </executable>
    <executable name='costar_shafter_ros_ign_bridge'>
      <command>roslaunch --wait costar_shafter_sensor_config_1 vehicle_topics.launch world_name:=#{_worldName} name:=#{_name} uav:=1 lidar_3d:=1 laser_scan:=0 top_scan:=0 bottom_scan:=0 stereo_cam:=0 mono_cam:=0 rgbd_cam:=1</command>
    </executable>
  HEREDOC
end
