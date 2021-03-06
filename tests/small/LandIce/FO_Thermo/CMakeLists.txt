get_filename_component(testNameRoot ${CMAKE_CURRENT_SOURCE_DIR} NAME)

if (ALBANY_IOPX)
  set (USE_SERIAL_MESH "true")
else ()
  # If there's no Iopx, we *must* have ALBANY_DECOMP defined (to decompose the mesh)
  # OR execute with only one rank.
  IF (ALBANY_MPI AND NOT ${ALBANY_SEACAS_PATH})
    MESSAGE (FATAL_ERROR "Error! Cannot execute FO_GIS tests in parallel without Iopx or decomp from Trilinos.\n")
  ENDIF()
 set (USE_SERIAL_MESH "false")
endif()

if (ALBANY_EPETRA)

  # Copy input file from source to binary dir
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_FO_Thermo_dry_bed_test.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_FO_Thermo_dry_bed_test.yaml)
                 
  # Copy input file from source to binary dir
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_FO_Thermo_wet_bed_test.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_FO_Thermo_wet_bed_test.yaml)
                 
  # Copy input file from source to binary dir
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_FO_Thermo_Humboldt_fluxDiv.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_FO_Thermo_Humboldt_fluxDiv.yaml)

  # Create the tests
  set (testName ${testNameRoot}_Dry_Bed)
  add_test(${testName} ${Albany.exe} input_FO_Thermo_dry_bed_test.yaml)
  set_tests_properties(${testName} PROPERTIES LABELS "LandIce;Epetra;Forward")
  
  set (testName ${testNameRoot}_Wet_Bed)
  add_test(${testName} ${Albany.exe} input_FO_Thermo_wet_bed_test.yaml)
  set_tests_properties(${testName} PROPERTIES LABELS "LandIce;Epetra;Forward")
  
  set (testName ${testNameRoot}_Humboldt_fluxDiv)
  add_test(${testName} ${Albany.exe} input_FO_Thermo_Humboldt_fluxDiv.yaml)
  set_tests_properties(${testName} PROPERTIES LABELS "LandIce;Epetra;Forward")
endif()

if (ALBANY_FROSCH)
  # Copy input file from source to binary dir
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_FO_Thermo_wet_bed_test_FROSch.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_FO_Thermo_wet_bed_test_FROSch.yaml)

  # Create the tests
  set (testName ${testNameRoot}_Wet_Bed_FROSch)
  add_test(${testName} ${Albany.exe} input_FO_Thermo_wet_bed_test_FROSch.yaml)
  set_tests_properties(${testName} PROPERTIES LABELS "LandIce;Tpetra;Forward;FROSch")
endif()
