# Test file for Lab3_BitManipulation


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Add tests below
test "PINA: 0xFF, PINB: 0xFF => PORTC: 16"
setPINA 0xFF
setPINB 0xFF
continue 5
expectPORTC 16
checkResult

test "PINA: 0xF0, PINB: 0x0F => PORTC: 8"
setPINA 0xF0
setPINB 0x0F
continue 5
expectPORTC 8
checkResult

test "PINA: 0x00, PINB: 0x00 => PORTC: 0"
setPINA 0x00
setPINB 0x00
continue 5
expectPORTC 0
checkResult

test "PINA: 0xE7, PINB: 0x59 => PORTC: 10"
setPINA 0xE7
setPINB 0x59
continue 5
expectPORTC 10
checkResult

test "PINA: 0x00, PINB: 0x11 => PORTC: 2"
setPINA 0x00
setPINB 0x11
continue 5
expectPORTC 2
checkResult

test "PINA: 0x22, PINB: 0x00 => PORTC: 2"
setPINA 0x22
setPINB 0x00
continue 5
expectPORTC 2
checkResult

test "PINA: 0x84, PINB: 0x21 => PORTC: 4"
setPINA 0x84
setPINB 0x21
continue 5
expectPORTC 4
checkResult



# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
