##
# Copyright 2009 Jakob Westhoff. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#    1. Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
# 
#    2. Redistributions in binary form must reproduce the above copyright notice,
#       this list of conditions and the following disclaimer in the documentation
#       and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY JAKOB WESTHOFF ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL JAKOB WESTHOFF OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# The views and conclusions contained in the software and documentation are those
# of the authors and should not be interpreted as representing official policies,
# either expressed or implied, of Jakob Westhoff
##


# - Find vala compiler
# This module finds if vala compiler is installed and determines where the
# executables are. This code sets the following variables:
#
#  VALA_FOUND       - Was the vala compiler found
#  VALA_EXECUTABLE  - path to the vala compiler
#  VALA_VERSION     - The version number of the available valac

find_program(VALA_EXECUTABLE
  NAMES valac)

# handle the QUIETLY and REQUIRED arguments and set VALA_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Vala DEFAULT_MSG VALA_EXECUTABLE)

mark_as_advanced(VALA_EXECUTABLE)

# Determine vala version
execute_process(COMMAND ${VALA_EXECUTABLE} "--version" 
                OUTPUT_VARIABLE "VALA_VERSION")
string(REPLACE "Vala" "" "VALA_VERSION" ${VALA_VERSION})
string(STRIP ${VALA_VERSION} "VALA_VERSION")
