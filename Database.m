function varargout = Database(varargin)
% DATABASE MATLAB code for Database.fig
%      DATABASE, by itself, creates a new DATABASE or raises the existing
%      singleton*.
%
%      H = DATABASE returns the handle to a new DATABASE or the handle to
%      the existing singleton*.
%
%      DATABASE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATABASE.M with the given input arguments.
%
%      DATABASE('Property','Value',...) creates a new DATABASE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Database_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Database_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Database

% Last Modified by GUIDE v2.5 07-Apr-2021 10:16:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Database_OpeningFcn, ...
                   'gui_OutputFcn',  @Database_OutputFcn, ...
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


% --- Executes just before Database is made visible.
function Database_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Database (see VARARGIN)

% Choose default command line output for Database
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');

% UIWAIT makes Database wait for user response (see UIRESUME)
% uiwait(handles.figure1);
filename = 'Data_Mahasiswa.xlsx';
[~,~,data] = xlsread(filename);
no_base = (data(:,2));
k = 2;
 
while k<=numel(no_base)
    nim = data{k,2};
    nama = data{k,3};
    jenis_kel = data{k,4};
    ttl = data{k,5};
    if isnan(ttl)
        ttl = '';
    end
    alamat = data{k,6};
    if isnan(alamat)
        alamat = '';
    end
    tahun_masuk = data{k,7};
    if isnan(tahun_masuk)
        tahun_masuk = '';
    end
    bidang_min = data{k,8};
    data2(k-1,:) = {nim,nama,jenis_kel,ttl,alamat,tahun_masuk,bidang_min};
    k = k+1;
end
set(handles.uitable1,'Data',data2,'ForegroundColor',[0 0 0])

% --- Outputs from this function are returned to the command line.
function varargout = Database_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
guidata(Database_Matematika);
