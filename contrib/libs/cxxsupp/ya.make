LIBRARY()

# Proxy library
LICENSE(Not-Applicable)



NO_PLATFORM()

IF (OS_ANDROID)
    # Use pre-compiled builtins from Android NDK
ELSEIF (CLANG OR USE_LTO)
    # These builtins are equivalent to clang -rtlib=compiler_rt and
    # are needed by potentially any code generated by clang.
    PEERDIR(
        contrib/libs/cxxsupp/builtins
    )
ENDIF ()

IF (NOT USE_STL_SYSTEM)
    PEERDIR(
        contrib/libs/cxxsupp/libcxx
    )
ELSE()
    PEERDIR(
        contrib/libs/cxxsupp/system_stl
    )
ENDIF()

END()
