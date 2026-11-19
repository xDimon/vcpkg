vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xDimon/soralog
    REF "v${VERSION}"
    SHA512 d0c78ac3d8ba5b1ad025c6c695f97579203337088f25890de33362e60ec629f92ea8cf19487c0b3bd061d032f8952be90cd322ffb1da092128a45630b176b731
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DPACKAGE_MANAGER=vcpkg
        -DBUILD_TESTS=OFF
        -DBUILD_BENCHMARKS=OFF
        -DBUILD_BENCHMARK_COMPARE=OFF
        -DEXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
