# osxcross-toolchain.cmake

# 1. Сообщаем CMake, для какой системы мы собираем
set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.13)

# 2. Указываем компиляторы из OSXCross
#    Путь к ним будет передан через переменную окружения OSXCROSS_ROOT в workflow
set(CMAKE_C_COMPILER ${OSXCROSS_ROOT}/target/bin/o64-clang)
set(CMAKE_CXX_COMPILER ${OSXCROSS_ROOT}/target/bin/o64-clang++)

# 3. Указываем корневую директорию, где лежат все наши собранные библиотеки
#    Путь также будет передан через переменную окружения MACDEPS_DIR в workflow
set(CMAKE_FIND_ROOT_PATH ${MACDEPS_DIR})

# 4. *** САМЫЕ ВАЖНЫЕ НАСТРОЙКИ: управляем поиском ***
#    Программы (компиляторы, pkg-config) ищем ТОЛЬКО в хост-системе
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#    Библиотеки и заголовки ищем ТОЛЬКО в нашей целевой директории ${MACDEPS_DIR}
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
