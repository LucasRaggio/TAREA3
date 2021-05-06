//+
SetFactory("OpenCASCADE");



L1 = 0.02;
t1 = 0.005; 

L2 = 0.160;
t2 = 0.004; 

L3 = 0.02;
t3 = 0.005; 

H =  0.04;
D12 = (t1-t2)/2;


Point(1) = {0, 0, 0, 1.0};
Point(2) = {L1, 0, 0, 1.0};
Point(3) = {L1, H, 0, 1.0};
Point(4) = {0, H, 0, 1.0};

Point(5) = {  L1 , 0, 0, 1.0};
Point(6) = {L2+L1, 0, 0, 1.0};
Point(7) = {L2+L1, H, 0, 1.0};
Point(8) = {  L1 , H, 0, 1.0};


Point(9) =  {L2+L1, 0, 0, 1.0};
Point(10) = {L3+L2+L1, 0, 0, 1.0};
Point(11) = {L3+L2+L1, H, 0, 1.0};
Point(12) = {L2+L1, H, 0, 1.0};




Line(1) = {1, 2};
//+
Line(2) = {2, 6};
//+
Line(3) = {6, 10};
//+
Line(4) = {10, 11};
//+
Line(5) = {11, 7};
//+
Line(6) = {7, 3};
//+
Line(7) = {3, 4};
//+
Line(8) = {4, 1};
//+
Line(9) = {2, 3};
//+
Line(10) = {7, 6};

Curve Loop(1) = {8, 1, 9, 7};
Plane Surface(1) = {1};

Curve Loop(2) = {10, 3, 4, 5};
Plane Surface(2) = {2};

Rectangle(3) = {0.02, 0., 0, 0.16, 0.04, 0};
Circle(15) = {0.1, 0.02, 0, 0.01, 0, 2*Pi};



Curve Loop(4) = {15};
Plane Surface(4) = {4};
BooleanDifference{ Surface{3}; Delete; }{ Surface{4}; Delete; }



Point(22) = {0.1, 0.03, 0, 1.0};
Point(23) = {0.1, 0.01, 0, 1.0};
Point(24) = {0.11, 0.02, 0, 1.0};
Point(25) = {0.09, 0.02, 0, 1.0};
MeshSize {1, 4, 3, 2, 6, 10, 11, 7} = 0.02;
MeshSize {22, 17, 25, 23} = 0.01;
MeshSize {25, 22, 17, 23} = 0.005;
