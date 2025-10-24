`timescale 1ns / 1ps
module tb_picorv32_system();

    reg clk;
    reg rst_n;

    always #10 clk = ~clk;

    picorv32_system dut (
        .clk   (clk),
        .rst_n (rst_n)
    );

    initial begin
        $dumpfile("logical/sim/tb_picorv32_system.vcd");
        $dumpvars(0, tb_picorv32_system);
    end

    initial begin
        clk = 0;
        rst_n = 0;
        #100;
        rst_n = 1;
        #100;
        rst_n = 0;

        $display("Monitoring AXI transactions...");

        #800000;

        #100;
        $finish;
    end

    always @(posedge clk) begin
        if (dut.m0_ARVALID && dut.m0_ARREADY) begin
            $display("Read Request: Addr = 0x%h", dut.m0_ARADDR);
        end
        if (dut.m0_RVALID && dut.m0_RREADY) begin
            $display("Read Data: Data = 0x%h", dut.m0_RDATA);
        end
        if (dut.m0_WVALID && dut.m0_AWREADY) begin
            $display("Write Request: Addr = 0x%h", dut.m0_AWADDR);
        end
        if (dut.m0_WVALID && dut.m0_WREADY) begin
            $display("Write Data: Data = 0x%h, Strb = 0x%h", dut.m0_WDATA, dut.m0_WSTRB);
        end
    end

endmodule