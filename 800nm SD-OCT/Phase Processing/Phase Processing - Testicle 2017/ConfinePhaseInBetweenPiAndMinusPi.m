
function [Phase]=ConfinePhaseInBetweenPiAndMinusPi(Phase)
% Masum 06162015
 Phase(Phase > +pi) = Phase(Phase > +pi) - 2.0*pi;
 Phase(Phase < -pi) = Phase(Phase < -pi) + 2.0*pi;
end