function [position, velocity, accel] = straightTrack(theta,v_0,g,s_0,s_f,num_points)
%--------------------------------------------------------------------------
%
% Input:
%
% theta = angle of inclination
% v_0 = inital velocity vector
% g = gravity 9.81 m/s^2
% s_0 = initial position vector
% s_f = final position vector
% num_points = arbitrary linspace of points
%
% Output:
%
% position = position vector 
% velocity = vector of velocity magnitudes along track 
% accel = acceleration magnitude along track
%
%--------------------------------------------------------------------------

line = sqrt((s_f(1)-s_0(1))^2 + (s_f(2)-s_0(2))^2 +(s_f(3)-s_0(3))^2); % distance (magnitude)
track = linspace(0,line,num_points);

position = zeros(3,num_points); % creating zero matrix for track lengths aka position
velocity = zeros(num_points); % creating zero vector for velocity at each point
accel = zeros(3,num_points); % creating zero matrix for acceleration at each point

x_test = s_f(1) - s_0(1); % deciding which axis is not being used

for i = 1 : num_points

    if x_test ~= 0 % if statement deciding which axis to utilize
    position(1,i) = s_0(1) + position(1:i) + ((track(i) - track(i-1)) * cos(theta)); % position vector for x axis
    position(2,i) = s_f(2); % position vector for y axis

    accel(1,i) = g * cos(theta); % acceleration in x axis
    accel(2,i) = 0; % acceleration in y axis
    
    else
    position(1,i) = s_f(1); % position vector for x axis
    position(2,i) = s_0(2) + position(2:i) + ((track(i) - track(i-1)) * cos(theta)); % position vector for y axis


    accel(1,i) = 0; % acceleration in x axis
    accel(2,i) = g * cos(theta); % acceleration in y axis
    end

    position(3,i) = s_0(3) + position(3:i) + ((track(i) - track(i-1)) * sin(theta)); % position vector for z axis
    velocity = v_0 + sqrt(2 * g * (s_0(3) - s_f(3))); % magnitude of velocity of any point
    accel(2,i) = g * cos(theta); % acceleration in z axis
end


for i = 1 : num_points
    accel = g * cos(theta);
end




