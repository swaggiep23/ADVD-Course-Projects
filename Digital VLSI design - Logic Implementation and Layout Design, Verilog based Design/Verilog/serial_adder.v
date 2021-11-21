module serial_adder(
    input clock,
    input [7:0] DA,
    input [7:0] DB,
    input Cin1,
    output Cout,
    output reg [7:0] Sum,
    input load
    ); 

 
    reg Cin; 
    wire S;
    wire Cout; 
    reg [7:0] A, B;
    wire w1, w2, w3; 

    // 1 Bit Adder - Gate Level Modelling
    xor (w1, A[0], B[0]);
    and (w2, w1, Cin); 
    and (w3, A[0], B[0]);
    xor (S, w1, Cin);
    or (Cout, w2, w3);

   initial $monitor("time=%d, A=%d, B=%d, load=%b, Cin=%b, A[0]=%b, B[0]=%b, Cout=%b, Sum=%b", $time, A, B, load, Cin, A[0], B[0], Cout, Sum);

    always @( posedge clock, posedge load) 
    begin
        if(load==0) 
        begin 
            A[0]<=A[1];
            A[1]<=A[2];
            A[2]<=A[3];
            A[3]<=A[4];
            A[4]<=A[5];
            A[5]<=A[6];
            A[6]<=A[7]; 
            A[7]<=A[0];

            B[0]<=B[1];
            B[1]<=B[2];
            B[2]<=B[3];
            B[3]<=B[4];
            B[4]<=B[5];
            B[5]<=B[6];
            B[6]<=B[7];
            B[7]<=B[0];
            Cin<=Cout; 

            Sum[0]<=Sum[1];
            Sum[1]<=Sum[2];
            Sum[2]<=Sum[3];
            Sum[3]<=Sum[4];
            Sum[4]<=Sum[5];
            Sum[5]<=Sum[6];
            Sum[6]<=Sum[7];
            Sum[7]<=S;
        end 

        if(load==1)
        begin 
            A<=DA;
            B<=DB;
            Cin<=Cin1;
        end
    end
endmodule
