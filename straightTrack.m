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
% position = position maxtrix along track 
% velocity = velocity matrix along track 
% accel = acceleration matrix along track
%
%--------------------------------------------------------------------------

line = sqrt((s_f(1)-s_0(1))^2 + (s_f(2)-s_0(2))^2 +(s_f(3)-s_0(3))^2); % distance (magnitude)
track = linspace(0,line,num_points);

position = zeros(3,num_points); % creating zero matrix for track lengths aka position
velocity = zeros(3,num_points); % creating zero vector for velocity at each point
accel = zeros(3,num_points); % creating zero matrix for acceleration at each point
v_mag = zeros(num_points);

x_test = s_f(1) - s_0(1); % deciding which axis is not being used

for i = 1 : num_points

    position(3,i) = s_0(3) + position(3:i) + ((track(i) - track(i-1)) * sin(theta)); % position vector for z axis
    v_mag(i) = v_0 + sqrt(2 * g * (s_0(3) - position(3,i))); % magnitude of velocity of any point
    velocity(3,i) = v_mag(i) * sin(theta); % velocity in z axis
    accel(3,i) = g * cos(theta); % acceleration in z axis

    if x_test ~= 0 % if statement deciding which axis to utilize
    position(1,i) = s_0(1) + position(1:i) + ((track(i) - track(i-1)) * cos(theta)); % position vector for x axis
    position(2,i) = s_f(2); % position vector for y axis

    velocity(1,i) = v_mag(i) * cos(theta); % velocity in x axis
    velocity(2,i) = 0; % velocity in y axis

    accel(1,i) = g * cos(theta); % acceleration in x axis
    accel(2,i) = 0; % acceleration in y axis
    
    else
    position(1,i) = s_f(1); % position vector for x axis
    position(2,i) = s_0(2) + position(2:i) + ((track(i) - track(i-1)) * cos(theta)); % position vector for y axis

    velocity(1,i) = 0; % velocity in x axis
    velocity(2,i) = v_mag(i) * cos(theta); % velocity in y axis

    accel(1,i) = 0; % acceleration in x axis
    accel(2,i) = g * cos(theta); % acceleration in y axis
    end


end


for i = 1 : num_points
    accel = g * cos(theta);
end




