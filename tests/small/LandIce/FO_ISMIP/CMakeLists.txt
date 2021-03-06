# Name the test with the directory name
get_filename_component(testNameRoot ${CMAKE_CURRENT_SOURCE_DIR} NAME)

####################################
###         TestA  tests         ###
####################################

set(testName ${testNameRoot}_TestA)

if (ALBANY_EPETRA) 
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testA.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testA.yaml COPYONLY)

  add_test(${testName}_Epetra ${Albany.exe} input_fo_ismip-hom_testA.yaml)
  set_tests_properties(${testName}_Epetra PROPERTIES LABELS "LandIce;Epetra;Forward")
endif()

if (ALBANY_IFPACK2)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testAT.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testAT.yaml COPYONLY)

  add_test(${testName}_Tpetra ${Albany.exe} input_fo_ismip-hom_testAT.yaml)
  set_tests_properties(${testName}_Tpetra PROPERTIES LABELS "LandIce;Tpetra;Forward")
endif()

####################################
###         TestB  tests         ###
####################################

# Currently broken
# set(testName ${testNameRoot}_TestB)

# if (ALBANY_EPETRA) 
#   configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testB.yaml
#                  ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testB.yaml COPYONLY)

#   add_test(${testName}_Epetra ${Albany.exe} input_fo_ismip-hom_testB.yaml)
#   set_tests_properties(${testName}_Epetra PROPERTIES LABELS "LandIce;Epetra;Forward")
# endif()


####################################
###         TestC  tests         ###
####################################

set(testName ${testNameRoot}_TestC)

if (ALBANY_EPETRA) 
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testC.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testC.yaml COPYONLY)

  add_test(${testName}_Epetra ${Albany.exe} input_fo_ismip-hom_testC.yaml)
  set_tests_properties(${testName}_Epetra PROPERTIES LABELS "LandIce;Epetra;Forward")
endif()


if (ALBANY_IFPACK2)
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testCT.yaml
                 ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testCT.yaml COPYONLY)

  add_test(${testName}_Tpetra ${Albany.exe} input_fo_ismip-hom_testCT.yaml)
  set_tests_properties(${testName}_Tpetra PROPERTIES LABELS "LandIce;Tpetra;Forward")
endif()

####################################
###         TestD  tests         ###
####################################

# Currently broken
# set(testName ${testNameRoot}_TestD)

# if (ALBANY_EPETRA) 
# configure_file(${CMAKE_CURRENT_SOURCE_DIR}/input_fo_ismip-hom_testD.yaml
#                ${CMAKE_CURRENT_BINARY_DIR}/input_fo_ismip-hom_testD.yaml COPYONLY)

#   add_test(${testName}_Epetra ${Albany.exe} input_fo_ismip-hom_testD.yaml)
#   set_tests_properties(${testName}_Epetra PROPERTIES LABELS "LandIce;Epetra;Forward")
# endif()
