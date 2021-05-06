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
Point(13) = {0,  0, t1, 1.0};
Point(14) = {L1, 0, t1, 1.0};
Point(15) = {L1, H, t1, 1.0};
Point(16) = {0,  H, t1, 1.0};





Point(5) = {  L1 , 0, D12, 1.0};
Point(6) = {L2+L1, 0, D12, 1.0};
Point(7) = {L2+L1, H, D12, 1.0};
Point(8) = {  L1 , H, D12, 1.0};
Point(17) = {  L1 , 0, t2+D12, 1.0};
Point(18) = {L2+L1, 0, t2+D12, 1.0};
Point(19) = {L2+L1, H, t2+D12, 1.0};
Point(20) = {  L1 , H, t2+D12, 1.0};





Point(9) =  {L2+L1, 0, 0, 1.0};
Point(10) = {L3+L2+L1, 0, 0, 1.0};
Point(11) = {L3+L2+L1, H, 0, 1.0};
Point(12) = {L2+L1, H, 0, 1.0};
Point(21) =  {  L2+L1, 0, t3, 1.0};
Point(22) = {L3+L2+L1, 0, t3, 1.0};
Point(23) = {L3+L2+L1, H, t3, 1.0};
Point(24) = {  L2+L1 , H, t3, 1.0};



Physical Curve("Fijo") = {4};

Physical Surface("Viga") = {1};


Line(1) = {1, 2};
Line(2) = {2, 5};
Line(3) = {5, 6};
Line(4) = {6, 9};
Line(5) = {9, 10};
Line(6) = {10, 22};
Line(7) = {22, 21};
Line(8) = {21, 18};
Line(9) = {18, 17};
Line(10) = {17, 14};
Line(11) = {14, 13};
Line(12) = {13, 1};

Line(13) = {4, 3};
Line(14) = {3, 8};
Line(15) = {8, 7};
Line(16) = {7, 12};
Line(17) = {12, 11};
Line(18) = {11, 23};
Line(19) = {23, 24};
Line(20) = {24, 19};
Line(21) = {19, 20};
Line(22) = {20, 15};
Line(23) = {15, 16};
Line(24) = {16, 4};


Line(25) = {1, 4};
Line(26) = {16, 13};

Line(27) = {14, 15};
Line(28) = {20, 17};

Line(29) = {2, 3};
Line(30) = {5, 8};

Line(31) = {10, 11};
Line(32) = {22, 23};

Line(33) = {9, 12};
Line(34) = {6, 7};

Line(35) = {18, 19};
Line(36) = {21, 24};


Curve Loop(1) = {11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
Plane Surface(1) = {1};

Curve Loop(2) = {26, 12, 25, -24};
Plane Surface(2) = {2};





Curve Loop(3) = {1, 29, -13, -25};
Plane Surface(3) = {3};

Curve Loop(4) = {23, 24, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22};
Plane Surface(4) = {4};

Curve Loop(5) = {32, -18, -31, 6};
Plane Surface(5) = {5};

Curve Loop(6) = {5, 31, -17, -33};
Plane Surface(6) = {6};

Curve Loop(7) = {33, -16, -34, 4};
Plane Surface(7) = {7};

Curve Loop(8) = {2, 30, -14, -29};
Plane Surface(8) = {8};

Curve Loop(9) = {11, -26, -23, -27};
Plane Surface(9) = {9};

Curve Loop(10) = {19, -36, -7, 32};
Plane Surface(10) = {10};

Curve Loop(11) = {35, -20, -36, 8};
Plane Surface(11) = {11};

Curve Loop(12) = {22, -27, -10, -28};
Plane Surface(12) = {12};



Circle(37) = {0.1, 0.02, 0.0005, 0.01, 0, 2*Pi};
Circle(38) = {0.1, 0.02, 0.0045, 0.01, 0, 2*Pi};

//+
Curve Loop(13) = {38};
Curve Loop(14) = {38};
Plane Surface(13) = {14};
Curve Loop(15) = {37};
Plane Surface(14) = {15};
//+
Rectangle(15) = {0.02, 0., 0.0005, 0.16, 0.04, 0};
Rectangle(16) = {0.02, 0., 0.0045, 0.16, 0.04, 0};
//+
BooleanDifference{ Surface{16}; Delete; }{ Surface{13}; Delete; }
BooleanDifference{ Surface{15}; Delete; }{ Surface{14}; Delete; }
//+
MeshSize {13, 1, 14, 17, 5, 2, 16, 4, 15, 20, 8, 3, 23, 11, 24, 19, 7, 12, 22, 10, 21, 18, 6, 9} = 0.01;
//+
MeshSize {13, 1, 4, 16, 15, 8, 14, 2, 5, 17, 20, 3} = 0.005;
//+
MeshSize {4, 16} = 0.001;
//+
MeshSize {2, 5, 17, 14, 13, 1, 15, 20, 8, 3, 4, 16} = 0.001;
//+
MeshSize {20, 15, 8, 3, 16, 4} = 0.002;
//+
MeshSize {2, 5, 17, 14, 13, 1} = 0.002;
//+
MeshSize {9, 6, 18, 21, 12, 7, 19, 24, 23, 11, 10, 22} = 0.002;
//+
MeshSize {26, 25} = 0.001;
