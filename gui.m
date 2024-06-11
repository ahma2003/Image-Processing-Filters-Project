function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 26-Dec-2023 02:38:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

end
% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

%-----------------Upload Image---------------------------.
function upload_Callback(hObject, eventdata, handles)
global X
X=uigetfile('*.*');
X=imread(X);
axes(handles.axes2);
imshow(X);
end

% -----------------------------Equalization-----------------------.
function Equalization_Callback(hObject, eventdata, handles)
global X
A=equalization(X);
axes(handles.axes3);
imshow(A);


end
% --------------------------Histogram------------------------.
function Histogram_Callback(hObject, eventdata, handles)
global X

axes(handles.axes4);
Histogram_gray_rgb(X);
end


% ----------------Rotate----------------------------.
function Rotate_Callback(hObject, eventdata, handles)
global X
rotate=imrotate(X,45);
axes(handles.axes3);
imshow(rotate);
end

% ---------------------High Pass -------------------------------.
function High_Pass_Callback(hObject, eventdata, handles)

end

% ---------------------Low Pass -------------------------------.
function Low_Pass_Callback(hObject, eventdata, handles)

end

% --- Ideal filter---------------------.
%first high_pass
function Ideal_Callback(hObject, eventdata, handles)
global X
radio1 =(get(handles.High_Pass,'value'));
radio2 =(get(handles.Low_Pass,'value'));
[h w l]=size(X);
t=str2num(get(handles.edit2,'string'));
axes(handles.axes3);
if radio1==1  %High_Pass
    if l==3   %rgb
        A=ideal_rgb(X,t,1);
    else   %gray
        A=ideal(X,t,1);
    end
end
if radio2==1  %Low_Pass
    if l==3
        A=ideal_rgb(X,t,0);
    else
        A=ideal(X,t,0);
    end
    
end    

imshow(A);
end

% --- -----------Gaussion filter -----------------------.
function Gaussian_Callback(hObject, eventdata, handles)
global X
radio1 =(get(handles.High_Pass,'value'));
radio2 =(get(handles.Low_Pass,'value'));
[h w l]=size(X);
t=str2num(get(handles.edit2,'string'));
axes(handles.axes3);
if radio1==1  %High_Pass
    if l==3   %rgb
        A=gaussian_rgb(X,t,1);
    else   %gray
        A=gaussian(X,t,1);
    end
end
if radio2==1  %Low_Pass
    if l==3
        A=gaussian_rgb(X,t,0);
    else
        A=igaussian(X,t,0);
    end
    
end    

imshow(A);
end

% --- ------------------Butter Worth------------------------.
function Butter_Worth_Callback(hObject, eventdata, handles)
global X
radio1 =(get(handles.High_Pass,'value'));
radio2 =(get(handles.Low_Pass,'value'));
[h w l]=size(X);
t=str2num(get(handles.edit2,'string'));
axes(handles.axes3);
if radio1==1  %High_Pass
    if l==3   %rgb
        A=butter_worth_rgb(X,t,1);
    else   %gray
        A=butter_worth(X,t,1);
    end
end
if radio2==1  %Low_Pass
    if l==3
        A=butter_worth_rgb(X,t,0);
    else
        A=butter_worth(X,t,0);
    end
    
end    

imshow(A);
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% ------------------RGB to binary--------------------------------- 
function RGB_to_Bin_Callback(hObject, eventdata, handles)
global X
A=RGB_to_Bin(X);
X=A;
axes(handles.axes3);
imshow(X);

end


% --- RGB to Gray-----------------
function RGB2Gray_Callback(hObject, eventdata, handles)
global X
A=RGB_to_Gray(X,1);
X=A;
axes(handles.axes3);
imshow(X);

end




% --- Gray to Binary-----------------------.
function Gray2Bin_Callback(hObject, eventdata, handles)
global X
A=Gray_to_Bin(X);
X=A;
axes(handles.axes3);
imshow(X);
end


% --- -------------------Reset---------------------.
function Reset_Callback(hObject, eventdata, handles)
cla(handles.axes3,'reset');
%cla(handles.axes4,'reset');

end
% --- Executes on button press in Add_Brightness.
function Add_Brightness_Callback(hObject, eventdata, handles)
global X
num=str2num(get(handles.Entered_Value_Of_Brightness,'string'));
A=brightness(X,1,num);
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Multiply_Brightness.
function Multiply_Brightness_Callback(hObject, eventdata, handles)
global X
num=str2num(get(handles.Entered_Value_Of_Brightness,'string'));
A=brightness(X,2,num);
axes(handles.axes3);
imshow(A);

end

% --- Executes on button press in Sub_Brightness.
function Sub_Brightness_Callback(hObject, eventdata, handles)
global X
num=str2num(get(handles.Entered_Value_Of_Brightness,'string'));
A=brightness(X,3,num);
axes(handles.axes3);
imshow(A);

end
% --- Executes on button press in Divide_Brightness.
function Divide_Brightness_Callback(hObject, eventdata, handles)
global X
num=str2num(get(handles.Entered_Value_Of_Brightness,'string'));
A=brightness(X,4,num);
axes(handles.axes3);
imshow(A);
end



function Entered_Value_Of_Brightness_Callback(hObject, eventdata, handles)
% hObject    handle to Entered_Value_Of_Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Entered_Value_Of_Brightness as text
%        str2double(get(hObject,'String')) returns contents of Entered_Value_Of_Brightness as a double

end

% --- Executes during object creation, after setting all properties.
function Entered_Value_Of_Brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Entered_Value_Of_Brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in Stretching.
function Stretching_Callback(hObject, eventdata, handles)
global X
new_min=str2num(get(handles.Value_of_NewMin,'string'));
new_max=str2num(get(handles.Value_of_NewMax,'string'));
A=stretching( X,new_min,new_max);
axes(handles.axes3);
imshow(A);

end

function Value_of_NewMin_Callback(hObject, eventdata, handles)
% hObject    handle to Value_of_NewMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Value_of_NewMin as text
%        str2double(get(hObject,'String')) returns contents of Value_of_NewMin as a double

end
% --- Executes during object creation, after setting all properties.
function Value_of_NewMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Value_of_NewMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function Value_of_NewMax_Callback(hObject, eventdata, handles)
% hObject    handle to Value_of_NewMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Value_of_NewMax as text
%        str2double(get(hObject,'String')) returns contents of Value_of_NewMax as a double
end

% --- Executes during object creation, after setting all properties.
function Value_of_NewMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Value_of_NewMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- LOG--------------------.
function LOG_Callback(hObject, eventdata, handles)
global X
A=transformations(X,1,2,1);
axes(handles.axes3);
imshow(A);

end
% --------------Power----------------------.
function Power_Callback(hObject, eventdata, handles)
global X
A=transformations(X,3,1,2);
axes(handles.axes3);
imshow(A);

end

% ----------------Inverse-----------------------.
function Inverse_Callback(hObject, eventdata, handles)

global X
A=transformations(X,2,2,1);%Ididn't sent y as i will apply log so i need only c
axes(handles.axes3);
imshow(A);

end
% --- Root------------------------------.
function pushbutton13_Callback(hObject, eventdata, handles)
global X
A=transformations(X,4,1,2);%Ididn't sent y as i will apply log so i need only c
axes(handles.axes3);
imshow(A);

end

% -----------------------Negative----------------------------------------.
function Negative_Callback(hObject, eventdata, handles)
global X
A=transformations(X,5,1,1);
axes(handles.axes3);
imshow(A);

end


% --- Executes on button press in Salt_and_Peper.
function Salt_and_Peper_Callback(hObject, eventdata, handles)
global X
[H W L]=size(X);
t1=str2num(get(handles.edit6,'string'));
t2=str2num(get(handles.edit7,'string'));
if L==3
    A=salt_pepper_rgb( X,t1,t2 );
else
     A=salt_pepper(X,t1,t2 );
end
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Exponential.
function Exponential_Callback(hObject, eventdata, handles)
global X
t1=str2num(get(handles.edit6,'string'));
A=noise_exponential_all( X,t1);
axes(handles.axes3);
imshow(A)

end
% --- Executes on button press in Uniform.
function Uniform_Callback(hObject, eventdata, handles)
global X
t1=str2num(get(handles.edit6,'string'));
t2=str2num(get(handles.edit7,'string'));
A=noise_uniform_all( X,t1,t2);
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Gaussian.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to Gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end
% --- Executes on button press in Rayleigh.
function Rayleigh_Callback(hObject, eventdata, handles)
global X
[H W L]=size(X);
t1=str2num(get(handles.edit6,'string'));
t2=str2num(get(handles.edit7,'string'));
if L==3
    A=noise_rayleigh_rgb( X,t1,t2 );
else
     A=noise_rayleigh(X,t1,t2 );
end
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Gamma.
function Gamma_Callback(hObject, eventdata, handles)
global X
[H W L]=size(X);
t1=str2num(get(handles.edit6,'string'));
t2=str2num(get(handles.edit7,'string'));
if L==3
    A=noise_gamma_rgb( X,t1,t2 );
else
     A=noise_gamma(X,t1,t2 );
end
axes(handles.axes3);
imshow(A);
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
end

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double

end
% --- New Min--------------------------- (Text).
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
end

% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in Apply_Filter.
function Apply_Filter_Callback(hObject, eventdata, handles)
global X
val =(get(handles.popupmenu3,'value'));
switch val
    case 2
        
        A=min_filter(X);
        axes(handles.axes3);
        imshow(A);
    case 3
        A=max_filter(X);
        axes(handles.axes3);
        imshow(A);
    case 4
        A=mean_filter(X);
        axes(handles.axes3);
        imshow(A);
    case 5
         A=median_filter(X);
        axes(handles.axes3);
        imshow(A);
        
    case 6
         A=midpoint_filter(X);
        axes(handles.axes3);
        imshow(A);
        
end

end
% --- Executes on button press in Fourier_Transformation.
function Fourier_Transformation_Callback(hObject, eventdata, handles)
global X
[h w l]=size(X);
if l==1
    A=FourierTransform_gray(X);
    axes(handles.axes3);
    
else
    A=FourierTransform_rgb(X);
    axes(handles.axes3);
    
end
imshow(A);
    
    
    
    
end

% --- Executes on button press in Inverse_Fourier.
function Inverse_Fourier_Callback(hObject, eventdata, handles)
global X
[h w l]=size(X);
if l==1
    A=FourierTransforminverse_gray(X);
    axes(handles.axes3);
    imshow(A);
else
    A=FourierTransforminverse_rgb(X);
    axes(handles.axes3);
    imshow(A);
end
end

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
end

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in Select_Filter.
function Select_Filter_Callback(hObject, eventdata, handles)
global X
val =(get(handles.popupmenu1,'value'));
switch val
    case 2
        
        A=average(X);
    case 3
        
        A= weighted_average(X);
        
end
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Choose_Filter.
function Choose_Filter_Callback(hObject, eventdata, handles)
global X
val =(get(handles.line_detection,'value'));
switch val
    case 2
        
        A=sobel_vertical_filter(X);
    case 3
        
        A= sobel_horizontal_filter(X);
    case 4
        
        A= sobel_DL_filter(X);
    case 5
        
        A= sobel_DR_filter(X);
    case 6
        
        A= rebort_vertical_filter(X);
    case 7
        
        A= rebort_horizental_filter(X);
    case 8
        
        A= rebort_Dl_filter(X);
    case 9
        
        A= rebort_DR_filter(X);
    
        
end
axes(handles.axes3);
imshow(A);
end

% --- Executes on button press in Laplacian.
function Laplacian_Callback(hObject, eventdata, handles)
% hObject    handle to Laplacian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end
% --- Executes on button press in Determin_filter.
function Determin_filter_Callback(hObject, eventdata, handles)
global X
val =(get(handles.point_sharpenning,'value'));
switch val
    case 2
        
        A=laplacian_filter(X);
    case 3
        
        A= composite_laplacian_filter(X);
    case 4
        
        A= Highboost_filter(X);
    case 5
        
        A= prewitt_horizontal_filter(X);
        
end
axes(handles.axes3);
imshow(A);
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)


end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in line_detection.
function line_detection_Callback(hObject, eventdata, handles)
% hObject    handle to line_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns line_detection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from line_detection
end


% --- Executes during object creation, after setting all properties.
function line_detection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to line_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in point_sharpenning.
function point_sharpenning_Callback(hObject, eventdata, handles)
% hObject    handle to point_sharpenning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns point_sharpenning contents as cell array
%        contents{get(hObject,'Value')} returns selected item from point_sharpenning
end

% --- Executes during object creation, after setting all properties.
function point_sharpenning_CreateFcn(hObject, eventdata, handles)
% hObject    handle to point_sharpenning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in Gauusian_noise.
function Gauusian_noise_Callback(hObject, eventdata, handles)
global X
[H W L]=size(X);
t1=str2num(get(handles.edit6,'string'));
t2=str2num(get(handles.edit7,'string'));
if L==3
    A=noise_gamma_rgb( X,t1,t2 );
else
     A=noise_gamma(X,t1,t2 );
end
axes(handles.axes3);
imshow(A);
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Gauusian_noise.
function Gauusian_noise_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Gauusian_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
