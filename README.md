# Using the NAG Library with Kdb+ in a Pure Q Environment

This repository contains the example scripts to accompany the NAG Technical Report with the above title.  Included are three sets of q scripts, each compatible with a separate implementation of the Mark 26.2 release of the NAG C Library:
*	64-bit Linux with 32-bit Integers (product code: CLL6I262CL)
*	64-bit Linux with 64-bit Integers (product code: CLL6I262DL)
*	64-bit Windows with 32-bit Integers (product code: CLW6I262EL)

## Requirements

These example scripts require the following software to be installed:
* Kdb+ from Kx Systems (http://www.kx.com) 
* Foreign Function Inteface (FFI) from Kx Systems (https://code.kx.com/q/interfaces/ffi/) 
* NAG C Library Mark 26.2 (http://www.nag.com) 

## Examples

We recommend that you copy your chosen set of example scripts to your `$QHOME` directory.  To execute an example script, start a q session, then enter the command:
> ~~~
> q) \l file_name.q
> ~~~
in your q console, where `file_name.q` represents the script you wish to run.   

## NAG License

A NAG C Library license is required to execute these scripts.  To obtain a free 30-day trial license, please email support@nag.com.
