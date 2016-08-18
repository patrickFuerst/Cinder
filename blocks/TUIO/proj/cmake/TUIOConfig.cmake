if( NOT TARGET TUIO )
	get_filename_component( TUIO_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )

	add_library( TUIO ${TUIO_SOURCE_PATH}/TUIO.cpp )

	target_compile_options( TUIO PUBLIC "-std=c++11" )
	target_include_directories( TUIO PUBLIC "${TUIO_SOURCE_PATH}" )

	# Add OSC block as a dependency
	get_filename_component( OSC_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../OSC/proj/cmake" ABSOLUTE )
	message( "OSC_MODULE_PATH: ${OSC_MODULE_PATH}" )

	list( APPEND CMAKE_MODULE_PATH "${OSC_MODULE_PATH}" )

	find_package( OSC REQUIRED )
	add_dependencies( TUIO OSC )
	target_link_libraries( TUIO OSC )
endif()
