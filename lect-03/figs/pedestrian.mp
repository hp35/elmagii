% pedestrian.mp
% A stylized pedestrian silhouette (traffic-light style) as a single path `man`.
% Scalable: change `s` to resize, or transform the path afterwards.

%prologues := 3;
%outputtemplate := "%j-%c.eps";

beginfig(1);
    numeric s; s := 1cm; % base scale (size of the figure)

    % Define the silhouette as a single closed path.
    % Coordinates are given in multiples of `s`. The shape is drawn clockwise.
    path man;
    man :=
        % start at top of head (slightly above center)
        (0, 13.0s)
        .. ( 0.9s, 12.9s) .. (1.6s, 12.2s)      % upper-right head curve
        .. (1.9s, 11.0s) .. (1.6s, 9.8s)       % jaw to right neck
        .. (2.3s, 8.9s) .. (3.4s, 9.1s)        % right shoulder / arm start
        .. (4.0s, 9.4s) .. (4.3s, 8.6s)        % right upper arm
        .. (3.8s, 7.6s) .. (3.2s, 7.2s)        % right forearm / hand
        .. (3.0s, 6.6s) .. (3.6s, 6.2s)        % torso right lower
        .. (3.0s, 5.2s) .. (2.4s, 4.7s)        % hip / upper right leg start
        .. (2.1s, 3.6s) .. (2.6s, 2.6s)        % right thigh to knee
        .. (2.9s, 1.6s) .. (2.2s, 0.9s)        % right calf to ankle
        .. (1.6s, 0.5s) .. (1.2s, 1.1s)        % right foot sole
        .. (0.2s, 1.4s) .. (-0.6s, 1.1s)       % under body to left foot
        .. (-1.3s, 0.6s) .. (-1.7s, 1.4s)      % left foot toe/heel
        .. (-2.2s, 2.6s) .. (-1.8s, 3.7s)      % left calf up
        .. (-1.4s, 4.8s) .. (-2.0s, 5.4s)      % left thigh / hip
        .. (-2.6s, 6.2s) .. (-2.0s, 7.2s)      % left torso lower
        .. (-2.6s, 7.6s) .. (-3.2s, 8.4s)      % left forearm area
        .. (-2.6s, 7.6s) .. (-3.2s, 8.4s)      % left forearm area
        .. (-3.0s, 9.4s) .. (-2.2s, 9.7s)      % left shoulder
        .. (-1.4s,10.0s) .. (-0.8s,11.0s)      % neck left
        .. (-0.6s,12.2s) .. (0, 13.0s)         % complete top-left of head to start
        --cycle;

    % Example usage: draw and fill centered on the origin.
    fill man withcolor .9[black,white]; % silhouette filled (traffic light style)
    draw man withpen pencircle scaled 1pt; % thin outline (optional)

    % Helpful guides (comment out if you just want the figure)
    % draw origin withcolor red; draw bbox man withcolor blue;
endfig;
end    
