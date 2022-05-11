classdef Schrodinger
    properties
        En = (11E3)*1.602E-19; % J
        V = 0; % Inside well
        m = 9.109E-31; % kg
        hbar = 1.054E-34; % J s
        s0 = [1,0];
    end
    
%     methods
%         function r = SchrodingerEq(t,s0) % inital psi and d/dx psi values
%             
%             psi = s0(1);
%             phi = s0(2); % First derivative
%             dphi = ((2*Schrodinger.m)/(Schrodinger.hbar^2))*(Schrodinger.En)*psi; % Second derivative
% 
%             r = [phi,dphi];
%         end
%         
%         function [x,r] = Solve(x0)
%             L = 1E-11;
%             dL = L/1000;
%             
%             [x,r] = RungeKutta4(Schrodinger.(SchrodingerEq),x0,0,L,dL);
%         end
%     end
end