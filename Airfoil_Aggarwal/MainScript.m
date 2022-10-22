%{
Name: Anirudh Aggarwal 
Email: aggarwaa@my.erua.edu 
Date: Mar 21, 2022 
Course: EGR 115 - sections #04DB
Assignment: HW - Airfoil Profile
Problem: Develop a re-usable solution to plot the input NACA value airfoil as well as checks to see if the user enters the right value.  
%}


%NACA value input
naca = input('Please enter the NACA #### with NACA in capital letter followed by space and four numbers: ','s');

%Checks the condtions that the user input is right --> The input conisits
%the word 'NACA' followed by space, first two numbers are either both 0 or
%between 1 and 5 and lastly the last two numbers are between 5 and 25
while length(naca)~=9||~strcmp(naca(1:4),'NACA') || ~isspace(naca(5)) ||  str2double(naca(6))> 0 && str2double(naca(6)) < 1 || str2double(naca(6)) > 5  || str2double(naca(7))>0 && str2double(naca(7)) < 1 ||  str2double(naca(7)) > 5 || str2double(naca(6))==0 && str2double(naca(7))~=0 ||  str2double(naca(7))==0 && str2double(naca(6))~=0 || mod(str2double(naca(8:9)),1) ~= 0 || str2double(naca(8:9)) < 5 || str2double(naca(8:9)) > 25 
   naca = input('ERROR: Please try again and reenter the value with the correct format: ','s');
end 

%Interpolates the values for user input 
camber = str2double(naca(6)); 
max_camber = str2double(naca(7));
max_thick = str2double(naca(8:9));
plot_name = sprintf('%s Profile', naca); % name of the plots


%Plots with respective to if the user info is symetrical or chamberd
if (camber==0 && max_camber == 0) % symetrical
    [Xvalues, Yupper, Ybottom] = Foilsym(max_thick/100);
    plot(Xvalues,Yupper)
    hold on
    plot (Xvalues,Ybottom)
    hold off
    title(plot_name)
else % chambered 
   [Xvalues, Xbottom, Yupper, Ybottom] = FoilCamber(camber/100,max_camber/100, max_thick/100);
   plot(Xvalues, Yupper)
   hold on 
   plot (Xbottom, Ybottom)
   hold off 
   title(plot_name)
end