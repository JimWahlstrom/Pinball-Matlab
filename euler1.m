function [new] = euler1(old, der,h)
%EULER Summary of this function goes here
%   
%
%
%   Detailed explanation goes here:
%   fun är en random funktion för att få skiten att fungera. Man behöver inte
%   en faktisk fil med det namnet.
%   a är tidsspannet vi simulerar i.
%   n är step-size
%_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

new=old+h*der;
end

