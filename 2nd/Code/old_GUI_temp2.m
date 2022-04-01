function varargout = old_GUI_temp2(varargin)
% OLD_GUI_TEMP2 MATLAB code for old_GUI_temp2.fig
%      OLD_GUI_TEMP2, by itself, creates a new OLD_GUI_TEMP2 or raises the existing
%      singleton*.
%
%      H = OLD_GUI_TEMP2 returns the handle to a new OLD_GUI_TEMP2 or the handle to
%      the existing singleton*.
%
%      OLD_GUI_TEMP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OLD_GUI_TEMP2.M with the given input arguments.
%
%      OLD_GUI_TEMP2('Property','Value',...) creates a new OLD_GUI_TEMP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before old_GUI_temp2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to old_GUI_temp2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help old_GUI_temp2

% Last Modified by GUIDE v2.5 25-Mar-2021 22:52:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @old_GUI_temp2_OpeningFcn, ...
                   'gui_OutputFcn',  @old_GUI_temp2_OutputFcn, ...
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


% --- Executes just before old_GUI_temp2 is made visible.
function old_GUI_temp2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to old_GUI_temp2 (see VARARGIN)

% Choose default command line output for old_GUI_temp2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes old_GUI_temp2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = old_GUI_temp2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
x=0:0.1*pi:2*pi;
y=sin(x);
plot(handles.axes1,x,y,'b-p');
cla(handles.axes2);
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
grid on

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
x=0:0.1*pi:2*pi;
y=cos(x);
plot(handles.axes2,x,y,'r-o');
cla(handles.axes1);
set(handles.radiobutton2,'Value',1);
set(handles.radiobutton1,'Value',0);
grid on
