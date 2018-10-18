# Create the AdderLib OBJECT library. List all sources and headers.
add_library(AdderLib OBJECT Adder.cpp include/Adder.h)

# Specify the public headers of the AdderLib library. This will make sure that the headers
# will be installed when installing the project.
set_target_properties(AdderLib PROPERTIES PUBLIC_HEADER include/Adder.h)

# Add the include folder to the public include directories.
# The include folder location will not be the same when the library is used from its build
# directory or from its install directory. The generator expressions $<BUILD_INTERFACE:> and 
# $<INSTALL_INTERFACE:> allow us to specify specific options for both cases.
target_include_directories(AdderLib PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
                                           $<INSTALL_INTERFACE:include>)

# Tell CMake that the AdderLib library should be installed when calling "make install".
install(TARGETS AdderLib
		# Add AdderLib to the CalculatorLibs-targets export set.
		EXPORT CalculatorLibs-targets
		# install objects in the "objects" folder. This works because AdderLib is an OBJECT library.
		OBJECTS DESTINATION objects
		# install public headers in the include folder.
		PUBLIC_HEADER DESTINATION include
	   )
