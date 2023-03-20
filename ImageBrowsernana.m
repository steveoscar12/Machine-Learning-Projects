function varargout = ImageBrowser(varargin)

% IMAGEBROWSER MATLAB code for ImageBrowser.fig
%      IMAGEBROWSER, by itself, creates a new IMAGEBROWSER or raises the existing
%      singleton*.
%
%      H = IMAGEBROWSER returns the handle to a new IMAGEBROWSER or the handle to
%      the existing singleton*.
%
%      IMAGEBROWSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEBROWSER.M with the given input arguments.
%
%      IMAGEBROWSER('Property','Value',...) creates a new IMAGEBROWSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageBrowser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageBrowser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageBrowser

% Last Modified by GUIDE v2.5 01-Aug-2018 16:44:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageBrowser_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageBrowser_OutputFcn, ...
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


% --- Executes just before ImageBrowser is made visible.
function ImageBrowser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageBrowser (see VARARGIN)

% Choose default command line output for ImageBrowser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageBrowser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageBrowser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename ,pathname] = uigetfile({'*.xls'},'File Selector');
image = strcat(pathname,filename);
dataset =xlsread(image,'Sheet1');
set(handles.uitable1,'data',dataset);
%dataset = readtable(image);
diff=max(dataset(:))-min(dataset(:));

set(handles.edit1,'string',filename);
set(handles.edit2,'string',pathname);
set(handles.edit3,'string',image);
set(handles.text5,'string',diff);


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.

 %dataset.Variables = dataset.Variables *2;
 %set(handles.uitable1,'data',dataset);


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

[filename ,pathname] = uigetfile({'*.xls'},'File Selector');
image = strcat(pathname,filename);
dataset =xlsread(image,'Sheet1');
%Work on Training Data
fullTable = readtable(image);
ID_REF_COL = fullTable.ID_REF;
ID_REF_ROW = fullTable.Properties.VariableNames;
NumberTable= fullTable(:,2:end);
ArrayTable = table2array(NumberTable);
minimum = min(ArrayTable(:));
maximum = max(ArrayTable(:));
difference = maximum - minimum;
FinalTable = round(ArrayTable*(0.9/difference),4);
%Work on Test Data
FullTestData = readtable('BeginnerTest.xlsx');
%Test_ID_REF_COL = FullTestData.ID_REF;
%Test_ID_REF_ROW = FullTestData.Properties.VariableNames;
Test_ID_REF_COL =cell2table(FullTestData.ID_REF);
Test_ID_REF_ROW =cell2table(FullTestData.Properties.VariableNames);


TestNumberTable= FullTestData(:,2:end);
TestArrayTable = table2array(TestNumberTable);
minimum1 = min(TestArrayTable(:));
maximum1 = max(TestArrayTable(:));
TestFinalTable = round(TestArrayTable*(0.9/(maximum1-minimum1)),4);


%Calculations of Value

set(handles.uitable1,'data',dataset);
%dataset = readtable(image);
diff=max(dataset(:))-min(dataset(:));



set(handles.edit1,'string',filename);
set(handles.edit2,'string',pathname);
set(handles.edit3,'string',image);
set(handles.text5,'string',diff);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
