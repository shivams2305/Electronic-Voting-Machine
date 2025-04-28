# Electronic-Voting-Machine

# What is Voting Machine?

This project implements a secure and reliable 
electronic voting machine using Verilog HDL 
(Hardware Description Language). The voting 
machine design includes robust features such as 
**button debouncing**,**vote counting**, **mode selection**, 
and **result display** to ensure accurate and secure 
voting processes. This project serves as a practical 
application of digital design principles in a critical 
domain, demonstrating real-world relevance and robustness.

# Features of EVM

 ● **Button Debouncing:** Ensures reliable detection of button 
presses by filtering out noise and ensuring stable input signals.

 ● **Vote Counting:** Accurately counts and records votes for 
multiple candidates, providing a dependable tallying 
mechanism.

 ● **Mode Selection:** Allows users to switch between voting mode 
and result display mode, enhancing flexibility and usability.

 ● **Result Display:** Displays voting results via LEDs or other 
output methods based on the selected mode, enabling 
transparent election monitoring.


# Project Structure 

The project is structured into modular Verilog components:

 1. **buttonControl.v**: Implements button debouncing logic to ensure accurate detection of button 
presses.

 2. **modeControl.v**: Manages mode selection and controls LED displays to reflect voting results based 
on the current mode.

 3. **vote_logger.v**: Logs and counts valid votes for each candidate, ensuring accurate tallying and 
recording of votes.

 4. **votingmachine.v**:Integrates all modules to form the complete voting system, orchestrating the 
voting process and result display.

 5. **TestBench.v**: Provides a simulation environment to validate and verify the functionality of the voting 
machine design.

# How to RUN?

1. **Clone the Repository:** https://github.com/shivams2305/Electronic-Voting-Machine.git

2. **Open in Verilog Simulation Tool:** Open your preferred Verilog simulation environment (e.g., ModelSim, Vivado).

3. **Compile:** Compile Verilog modules (votingMachine.v, testbench.v) in your simulation tool.

4. **Simulate:** Run the simulation using testbench.v to observe and verify the functionality of the voting machine design.

# Contact

In case of any queries or updates feel free to contact **shivamsingla7288277@gmail.com**.
