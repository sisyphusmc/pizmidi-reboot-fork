include(FetchContent)

message(STATUS "Fetching dependency: JUCE")
list(APPEND CMAKE_MESSAGE_INDENT "  ")
FetchContent_Declare(
  juce
  GIT_REPOSITORY https://github.com/juce-framework/JUCE.git
  GIT_TAG 965d0ca4be178c4a0000b116d460e15c30311992 # 7.0.2
)

# JUCE registers the built SDK for installation. But as for our own installers,
# we do not want a JUCE SDK to be included, we add the "EXCLUDE_FROM_ALL"
# parameter to the JUCE subdirectory being added. This has the notable effect
# that install commands are ignored.
FetchContent_Populate(juce)
add_subdirectory(${juce_SOURCE_DIR} ${juce_BINARY_DIR} EXCLUDE_FROM_ALL)
list(POP_BACK CMAKE_MESSAGE_INDENT)
