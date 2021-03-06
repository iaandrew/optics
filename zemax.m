classdef zemax < handle
    %This class is a wrapper for the zemax ZOSAPI. The class allows the
    %user to define a zemax object with all the properties to run a scan by
    %default. The user can also create a custom script and pass that to the
    %object instead of the default scan. This class has a unique zemax
    %boilerplate code and a default scan script. This allows the user the
    %flexibilty of custom scripting in MATLAB without diving into the
    %ZOSAPI
    
    
    properties (Access = public)
        %Full file directory with filename and extension
        directory = '';
        
        %filename
        filename = '';
        
        %path
        path = '';
        
        %extension
        extension = '';
        
        %configurations
        configurations = 1;
        number_of_configurations = [];
        
        %wavelength
        wavenglength = 'not setup yet';
        
        %Scan Angles
        H_range = [];
        V_range = [];
        
        %Facet colour order
        facet_name = {'R','Y','B','G'};

        
        %Metrics Definition - messy
        H_num = 10;
        V_num = 10;
        
%         metrics = struct('Completion',zeros(H_num,V_num),'HMirror',nan(H_num,V_num),'VMirror',nan(H_num,V_num),'spotRMS',nan(H_num,V_num),'cenX',nan(H_num,V_num),'cenY',...
%     nan(H_num,V_num),'angleX',nan(H_num,V_num),'angleY',nan(H_num,V_num),...
%     'quad_cenX',nan(H_num,V_num),'quad_cenY',nan(H_num,V_num),'quad_angleX',nan(H_num,V_num),'quad_angleY',nan(H_num,V_num),...
%     'pupil_cenX',nan(H_num,V_num),'pupil_cenY',nan(H_num,V_num),'pupil_angleX',nan(H_num,V_num),'pupil_angleY',nan(H_num,V_num),...
%     'hologram_cenX',nan(H_num,V_num),'hologram_cenY',nan(H_num,V_num),'hologram_angleX',nan(H_num,V_num),'hologram_angleY',nan(H_num,V_num),...
%     'FftPsfXFWHM',nan(H_num,V_num),'FftPsfYFWHM',nan(H_num,V_num),'HuygensPsfXFWHM',nan(H_num,V_num),'HuygensPsfYFWHM',nan(H_num,V_num),...
%     'Image_astigmatism',nan(H_num,V_num),'pupil_spotRMS',nan(H_num,V_num),'quad_spotRMS',nan(H_num,V_num),'hologram_spotRMS',nan(H_num,V_num),...
%     'epm_cenX',nan(H_num,V_num),'epm_cenY',nan(H_num,V_num),'epm_angleX',nan(H_num,V_num),'epm_angleY',nan(H_num,V_num),'epm_spotRMS',nan(H_num,V_num),...
%     'HuygensMTFS',nan(H_num,V_num),'HuygensMTFT',nan(H_num,V_num));
        
        
        
    end
    
    
    properties (Access = private)

        %H_facet_range = [-self.H_range(2),-self.H_range(1);self.H_range(1),self.H_range(2);-self.H_range(2),-self.H_range(1);self.H_range(1),self.H_range(2)];
        %V_facet_range = [-self.V_range(2),-self.V_range(1);self.V_range(1),self.V_range(2);-self.V_range(2),-self.V_range(1);self.V_range(1),self.V_range(2)];
        
    end
    
    methods
    %% zemax Constructor       
        function self = zemax(directory,configurations)
            if nargin == 0
                disp('Must specify the file location');
            elseif nargin == 1
                self.directory = directory;
                [self.path,self.filename,self.extension] = fileparts(directory);
                self.H_range = [0.5,6];
                self.V_range = [0.5,6];
            elseif nargin == 2
                self.configurations = configurations;
                self.number_of_configurations = length(configurations);
                self.directory = directory;
                [self.path,self.filename,self.extension] = fileparts(directory);
                self.H_range = [0.5,6];
                self.V_range = [0.5,6];
            end
            
            disp('Configuration order: ');
            disp([self.facet_name]);

        end
        
    %% Run Scan Script 
    %This function runs a default scan script to scan a projector or takes
    %in a custom script to run on the zemax file
        function output = run_script(custom_script)
            if nargin < 1
                output = script_scan;
            else
                output = custom_script;
            end
        end
        
    %% Create Directory
    %This function creates a new directory/folder to save the scan data
    function new_directory = create_directory(directory, foldername)
        new_directory = [directory,'\\',foldername];
        mkdir(name);
    end
        
    %% Run Zemax BoilerPlate Code
    %This function runs the zemax boilerplate code to set up the lens data,
    %multiconfiguration, merit function editors, the system and the
    %analysis. ***Note this code is generated by zemax and has been 
    %modified to be unique for this class ***
    function run_zemax_boilerplate()
    end
    
    %% Merit Function
    %This function builds the custom merit function or inserts the merit
    %function operands corresponding to the metrics property
    function [curren_mf, new_mf] = merit_function()
        %Save current merit function
        %Delete current merit function
    end
    
    
    %% Close zemax object
    %This function closes the zemax object restoring the merit original
    %merit function and other parameters of the file
    function Close()
        
    end
    
        
    end
    
end

