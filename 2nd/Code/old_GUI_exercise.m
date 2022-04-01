function varargout = old_GUI_exercise(varargin)
% OLD_GUI_EXERCISE MATLAB code for old_GUI_exercise.fig
%      OLD_GUI_EXERCISE, by itself, creates a new OLD_GUI_EXERCISE or raises the existing
%      singleton*.
%
%      H = OLD_GUI_EXERCISE returns the handle to a new OLD_GUI_EXERCISE or the handle to
%      the existing singleton*.
%
%      OLD_GUI_EXERCISE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OLD_GUI_EXERCISE.M with the given input arguments.
%
%      OLD_GUI_EXERCISE('Property','Value',...) creates a new OLD_GUI_EXERCISE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before old_GUI_exercise_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to old_GUI_exercise_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help old_GUI_exercise

% Last Modified by GUIDE v2.5 25-Mar-2021 23:04:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @old_GUI_exercise_OpeningFcn, ...
                   'gui_OutputFcn',  @old_GUI_exercise_OutputFcn, ...
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


% --- Executes just before old_GUI_exercise is made visible.
function old_GUI_exercise_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to old_GUI_exercise (see VARARGIN)

% Choose default command line output for old_GUI_exercise
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes old_GUI_exercise wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = old_GUI_exercise_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
changingValue = get(hObject,'Value');
x=-1:0.001*pi:changingValue;
plot(x,sin(10*x),'r-o')
axis([-1 1 -1 1]);
grid on;

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=-2*pi:0.1*pi:2*pi;
plot(x,x,'r-o')
grid on;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=-2*pi:0.1*pi:2*pi;
plot(x,sin(x),'g-o')
grid on;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = 0:pi/50:10*pi;
st = sin(t);
ct = cos(t);
plot3(st,ct,t,'b-o')
grid on;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(old_GUI_exercise);
