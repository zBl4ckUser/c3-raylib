module raylib;

const double PI = 3.14;
const double DEG2RAD = PI*180.0f;
const double RAD2DEG = 180.0f / PI;

/////////////////////M O D U L E :  R C O R E ///////////////////////////////////////
extern fn void init_window(int width, int height, char* title) @extern("InitWindow");
extern fn void close_window() @extern("CloseWindow");
extern fn bool window_should_close() @extern("WindowShouldClose");                          // Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
extern fn bool is_window_ready() @extern("IsWindowReady");                                   // Check if window has been initialized successfully
extern fn bool is_window_fullscreen() @extern("IsWindowFullscreen");                              // Check if window is currently fullscreen
extern fn bool is_window_hidden() @extern("IsWindowHidden");                                  // Check if window is currently hidden (only PLATFORM_DESKTOP)
extern fn bool is_window_minimized() @extern("IsWindowMinimized");                               // Check if window is currently minimized (only PLATFORM_DESKTOP)
extern fn bool is_window_maximized() @extern("IsWindowMaximized");                               // Check if window is currently maximized (only PLATFORM_DESKTOP)
extern fn bool is_window_focused() @extern("IsWindowFocused");                                 // Check if window is currently focused (only PLATFORM_DESKTOP)
extern fn bool is_window_resized() @extern("IsWindowResized");                                 // Check if window has been resized last frame
extern fn bool is_window_state(uint flag) @extern("IsWindowState");                      // Check if one specific window flag is enabled
extern fn void set_window_state(uint flags) @extern("SetWindowState");                    // Set window configuration state using flags (only PLATFORM_DESKTOP)
extern fn void clear_window_state(uint flags) @extern("ClearWindowState");                  // Clear window configuration state flags
extern fn void toggle_fullscreen() @extern("ToggleFullscreen");                                // Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
extern fn void toggle_borderless_windowed() @extern("ToggleBorderlessWindowed");                        // Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
extern fn void maximize_window() @extern("MaximizeWindow");                                  // Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
extern fn void minimize_window() @extern("MinimizeWindow");                                  // Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
extern fn void restore_window() @extern("RestoreWindow");

extern fn void set_window_icon(Image image) @extern("SetWindowIcon");                            // Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
extern fn void set_window_icons(Image *images, int count) @extern("SetWindowIcons");              // Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
extern fn void set_window_title(char *title) @extern("SetWindowTitle");                     // Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
extern fn void set_window_position(int x, int y) @extern("SetWindowPosition");                       // Set window position on screen (only PLATFORM_DESKTOP)
extern fn void set_window_monitor(int monitor) @extern("SetWindowMonitor");                         // Set monitor for the current window
extern fn void set_window_min_size(int width, int height) @extern("SetWindowMinSize");               // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
extern fn void set_window_max_size(int width, int height) @extern("SetWindowMaxSize");               // Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
extern fn void set_window_size(int width, int height) @extern("SetWindowSize");                  // Set window dimensions
extern fn void set_window_opacity(float opacity) @extern("SetWindowOpacity");                       // Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
extern fn void set_window_focused() @extern("SetWindowFocused");                                // Set window focused (only PLATFORM_DESKTOP)
extern fn void *get_window_handle() @extern("*GetWindowHandle");                                // Get native window handle
extern fn int get_screen_width() @extern("GetScreenWidth");                                   // Get current screen width
extern fn int get_screen_height() @extern("GetScreenHeight");                                  // Get current screen height
extern fn int get_render_width() @extern("GetRenderWidth");                                   // Get current render width (it considers HiDPI)
extern fn int get_render_height() @extern("GetRenderHeight");                                  // Get current render height (it considers HiDPI)
extern fn int get_monitor_count() @extern("GetMonitorCount");                                  // Get number of connected monitors
extern fn int get_current_monitor() @extern("GetCurrentMonitor");                                // Get current connected monitor
extern fn Vector2 get_monitor_position(int monitor) @extern("GetMonitorPosition");                    // Get specified monitor position
extern fn int get_monitor_width(int monitor) @extern("GetMonitorWidth");                           // Get specified monitor width (current video mode used by monitor)
extern fn int get_monitor_height(int monitor) @extern("GetMonitorHeight");                          // Get specified monitor height (current video mode used by monitor)
extern fn int get_monitor_physical_width(int monitor) @extern("GetMonitorPhysicalWidth");                   // Get specified monitor physical width in millimetres
extern fn int get_monitor_physical_height(int monitor) @extern("GetMonitorPhysicalHeight");                  // Get specified monitor physical height in millimetres
extern fn int get_monitor_refresh_rate(int monitor) @extern("GetMonitorRefreshRate");                     // Get specified monitor refresh rate
extern fn Vector2 get_window_position() @extern("GetWindowPosition");                            // Get window position XY on monitor
extern fn Vector2 get_window_scale_dpi() @extern("GetWindowScaleDPI");                            // Get window scale DPI factor
extern fn char *get_monitor_name(int monitor) @extern("*GetMonitorName");                    // Get the human-readable, UTF-8 encoded name of the specified monitor
extern fn void set_clipboard_text(char *text) @extern("SetClipboardText");                    // Set clipboard text content
extern fn char *get_clipboard_text() @extern("*GetClipboardText");                         // Get clipboard text content
extern fn void enable_event_waiting() @extern("EnableEventWaiting");                              // Enable waiting for events on EndDrawing(), no automatic event polling
extern fn void disable_event_waiting() @extern("DisableEventWaiting");                             // Disable waiting for events on EndDrawing(), automatic events polling

    // Cursor-related functions
extern fn void show_cursor() @extern("ShowCursor");                                      // Shows cursor
extern fn void hide_cursor() @extern("HideCursor");                                      // Hides cursor
extern fn bool is_cursor_hidden() @extern("IsCursorHidden");                                  // Check if cursor is not visible
extern fn void enable_cursor() @extern("EnableCursor");                                    // Enables cursor (unlock cursor)
extern fn void disable_cursor() @extern("DisableCursor");                                   // Disables cursor (lock cursor)
extern fn bool is_cursor_on_screen() @extern("IsCursorOnScreen");                                // Check if cursor is on the screen

//     // Drawing-related functions
extern fn void clear_background(Color color) @extern("ClearBackground");                          // Set background color (framebuffer clear color)
extern fn void begin_drawing() @extern("BeginDrawing");                                    // Setup canvas (framebuffer) to start drawing
extern fn void end_drawing() @extern("EndDrawing");                                      // End canvas drawing and swap buffers (double buffering)
extern fn void begin_mode_2d(Camera2D camera) @extern("BeginMode2D");                          // Begin 2D mode with custom camera (2D)
extern fn void end_mode_2d() @extern("EndMode2D");                                       // Ends 2D mode with custom camera
extern fn void begin_mode_3d(Camera3D camera) @extern("BeginMode3D");                          // Begin 3D mode with custom camera (3D)
extern fn void end_mode_3d() @extern("EndMode3D");                                       // Ends 3D mode and returns to default 2D orthographic mode
extern fn void begin_texture_mode(RenderTexture2D target) @extern("BeginTextureMode");   // Begin drawing to render texture
extern fn void end_texture_mode() @extern("EndTextureMode");                                  // Ends drawing to render texture
extern fn void begin_shader_mode(Shader shader) @extern("BeginShaderMode");                        // Begin custom shader drawing
extern fn void end_shader_mode() @extern("EndShaderMode");                                   // End custom shader drawing (use default shader)
extern fn void begin_blend_mode(BlendMode mode) @extern("BeginBlendMode");                              // Begin blending mode (alpha, additive, multiplied, subtract, custom)
extern fn void end_blend_mode() @extern("EndBlendMode");                                    // End blending mode (reset to default: alpha blending)
extern fn void begin_scissor_mode(int x, int y, int width, int height) @extern("BeginScissorMode"); // Begin scissor mode (define screen area for following drawing)
extern fn void end_scissor_mode() @extern("EndScissorMode");                                  // End scissor mode
extern fn void begin_vr_stereo_mode(VrStereoConfig config) @extern("BeginVrStereoMode");              // Begin stereo rendering (requires VR simulator)
extern fn void end_vr_stereo_mode() @extern("EndVrStereoMode");                                 // End stereo rendering (requires VR simulator)

// VR stereo config functions for VR simulator
extern fn VrStereoConfig load_vr_stereo_config(VrDeviceInfo device) @extern("LoadVrStereoConfig");     // Load VR stereo config for VR simulator device parameters
extern fn void unload_vr_stereo_config(VrStereoConfig config) @extern("UnloadVrStereoConfig");           // Unload VR stereo config

// Shader management functions
// NOTE: Shader functionality is not available on OpenGL 1.1
extern fn Shader load_shader(char* vsFileName, char* fsFileName) @extern("LoadShader");   // Load shader from files and bind default locations
extern fn Shader load_shader_from_memory(char* vsCode, char* fsCode) @extern("LoadShaderFromMemory"); // Load shader from code strings and bind default locations
extern fn bool is_shader_ready(Shader shader) @extern("IsShaderReady");                                   // Check if a shader is ready
extern fn int get_shader_location(Shader shader, char* uniformName) @extern("GetShaderLocation");       // Get shader uniform location
extern fn int get_shader_location_attrib(Shader shader, char  *attribName) @extern("GetShaderLocationAttrib");  // Get shader attribute location
extern fn void set_shader_value(Shader shader, ShaderLocationIndex locIndex, void *value, ShaderUniformDataType uniformType) @extern("SetShaderValue");               // Set shader uniform value
extern fn void set_shader_value_v(Shader shader, ShaderLocationIndex locIndex, void *value, ShaderUniformDataType uniformType, int count) @extern("SetShaderValueV");   // Set shader uniform value vector
extern fn void set_shader_value_matrix(Shader shader, ShaderLocationIndex locIndex, Matrix mat) @extern("SetShaderValueMatrix");         // Set shader uniform value (matrix 4x4)
extern fn void set_shader_value_texture(Shader shader, ShaderLocationIndex locIndex, Texture2D texture) @extern("SetShaderValueTexture"); // Set shader uniform value for texture (sampler2d)
extern fn void unload_shader(Shader shader) @extern("UnloadShader");                                    // Unload shader from GPU memory (VRAM)

// Screen-space-related functions
extern fn Ray get_mouse_ray(Vector2 mousePosition, Camera camera) @extern("GetMouseRay");      // Get a ray trace from mouse position
extern fn Matrix get_camera_matrix(Camera camera) @extern("GetCameraMatrix");                      // Get camera transform matrix (view matrix)
extern fn Matrix get_camera_matrix_2d(Camera2D camera) @extern("GetCameraMatrix2D");                  // Get camera 2d transform matrix
extern fn Vector2 get_world_to_screen(Vector3 position, Camera camera) @extern("GetWorldToScreen");  // Get the screen space position for a 3d world space position
extern fn Vector2 get_screen_to_world_2d(Vector2 position, Camera2D camera) @extern("GetScreenToWorld2D"); // Get the world space position for a 2d camera screen space position
extern fn Vector2 get_world_to_screen_ex(Vector3 position, Camera camera, int width, int height) @extern("GetWorldToScreenEx"); // Get size position for a 3d world space position
extern fn Vector2 get_world_to_screen_2d(Vector2 position, Camera2D camera) @extern("GetWorldToScreen2D"); // Get the screen space position for a 2d camera world space position

// Timing-related functions
extern fn void set_target_fps(int fps) @extern("SetTargetFPS");                                 // Set target FPS (maximum)
extern fn float get_frame_time() @extern("GetFrameTime");                                   // Get time in seconds for last frame drawn (delta time)
extern fn double get_time() @extern("GetTime");                                       // Get elapsed time in seconds since InitWindow()
extern fn int get_fps() @extern("GetFPS");                                           // Get current FPS

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL
extern fn void swap_screen_buffer() @extern("SwapScreenBuffer");                                // Swap back buffer with front buffer (screen drawing)
extern fn void poll_input_events() @extern("PollInputEvents");                                 // Register all input events
extern fn void wait_time(double seconds) @extern("WaitTime");                              // Wait for some time (halt program execution)

// Random values generation functions
extern fn void set_random_seed(uint seed) @extern("SetRandomSeed");                      // Set the seed for the random number generator
extern fn int get_random_value(int min, int max) @extern("GetRandomValue");                       // Get a random value between min and max (both included)
extern fn int *load_random_sequence(uint count, int min, int max) @extern("LoadRandomSequence"); // Load random values sequence, no values repeated
extern fn void unload_random_sequence(int *sequence) @extern("UnloadRandomSequence");                   // Unload random values sequence

// Misc. functions
extern fn void take_screenshot(char  *fileName) @extern("TakeScreenshot");                  // Takes a screenshot of current screen (filename extension defines format)
extern fn void set_config_flags(ConfigFlags flags) @extern("SetConfigFlags");                    // Setup init configuration flags (view FLAGS)
extern fn void open_url(char  *url) @extern("OpenURL");                              // Open URL with default system browser (if available)

// NOTE: Following functions implemented in module [utils]
//------------------------------------------------------------------
extern fn void trace_log(TraceLogLevel logLevel, char  *text, ...) @extern("TraceLog");         // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
extern fn void set_trace_log_level(TraceLogLevel logLevel) @extern("SetTraceLogLevel");                        // Set the current threshold (minimum) log level
extern fn void *mem_alloc(uint size) @extern("MemAlloc");                          // Internal memory allocator
extern fn void *mem_realloc(void *ptr, uint size) @extern("MemRealloc");             // Internal memory reallocator
extern fn void mem_free(void *ptr) @extern("MemFree");                                    // Internal memory free

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users
extern fn void set_trace_log_callback(TraceLogCallback callback) @extern("SetTraceLogCallback");         // Set custom trace log
extern fn void set_load_file_data_callback(LoadFileDataCallback callback) @extern("SetLoadFileDataCallback"); // Set custom file binary data loader
extern fn void set_save_file_data_callback(SaveFileDataCallback callback) @extern("SetSaveFileDataCallback"); // Set custom file binary data saver
extern fn void set_load_file_text_callback(LoadFileTextCallback callback) @extern("SetLoadFileTextCallback"); // Set custom file text data loader
extern fn void set_save_file_text_callback(SaveFileTextCallback callback) @extern("SetSaveFileTextCallback"); // Set custom file text data saver
// Files management functions
extern fn char *load_file_data(char  *fileName, int *dataSize) @extern("LoadFileData"); // Load file data as byte array (read)
extern fn void unload_file_data(char *data) @extern("UnloadFileData");                   // Unload file data allocated by LoadFileData()
extern fn bool save_file_data(char  *fileName, void *data, int dataSize) @extern("SaveFileData"); // Save data to file from byte array (write), returns true on success
extern fn bool export_data_as_code(char *data, int dataSize, char  *fileName) @extern("ExportDataAsCode"); // Export data to code (.h), returns true on success
extern fn char *load_file_text(char  *fileName) @extern("LoadFileText");                   // Load text data from file (read), returns a '\0' terminated string
extern fn void unload_file_text(char *text) @extern("UnloadFileText");                            // Unload file text data allocated by LoadFileText()
extern fn bool save_file_text(char  *fileName, char *text) @extern("SaveFileText");        // Save text data to file (write), string must be '\0' terminated, returns true on success
//------------------------------------------------------------------

// File system functions
extern fn bool file_exists(char  *fileName) @extern("FileExists");                      // Check if file exists
extern fn bool directory_exists(char  *dirPath) @extern("DirectoryExists");                  // Check if a directory path exists
extern fn bool is_file_extension(char  *fileName, char  *ext) @extern("IsFileExtension"); // Check file extension (including point: .png, .wav)
extern fn int get_file_length(char  *fileName) @extern("GetFileLength");                    // Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
extern fn char  *get_file_extension(char  *fileName) @extern("GetFileExtension");         // Get pointer to extension for a filename string (includes dot: '.png')
extern fn char  *get_file_name(char  *filePath) @extern("GetFileName");              // Get pointer to filename for a path string
extern fn char  *get_file_name_without_ext(char  *filePath) @extern("GetFileNameWithoutExt");    // Get filename string without extension (uses static string)
extern fn char  *get_directory_path(char  *filePath) @extern("GetDirectoryPath");         // Get full path for a given fileName with path (uses static string)
extern fn char  *get_prev_directory_path(char  *dirPath) @extern("GetPrevDirectoryPath");      // Get previous directory path for a given path (uses static string)
extern fn char  *get_working_directory() @extern("GetWorkingDirectory");                      // Get current working directory (uses static string)
extern fn char  *get_application_directory() @extern("GetApplicationDirectory");                  // Get the directory of the running application (uses static string)
extern fn bool change_directory(char  *dir) @extern("ChangeDirectory");                      // Change working directory, return true on success
extern fn bool is_path_file(char  *path) @extern("IsPathFile");                          // Check if a given path is a file or a directory
extern fn FilePathList load_directory_files(char  *dirPath) @extern("LoadDirectoryFiles");       // Load directory filepaths
extern fn FilePathList load_directory_files_ex(char  *basePath, char  *filter, bool scanSubdirs) @extern("LoadDirectoryFilesEx"); // Load directory filepaths with extension filtering and recursive directory scan
extern fn void unload_directory_files(FilePathList files) @extern("UnloadDirectoryFiles");              // Unload filepaths
extern fn bool is_file_dropped() @extern("IsFileDropped");                                   // Check if a file has been dropped into window
extern fn FilePathList load_dropped_files() @extern("LoadDroppedFiles");                        // Load dropped filepaths
extern fn void unload_dropped_files(FilePathList files) @extern("UnloadDroppedFiles");                // Unload dropped filepaths
extern fn long get_file_mod_time(char  *fileName) @extern("GetFileModTime");                  // Get file modification time (last write time)

// Compression/Encoding functionality
extern fn char *compress_data(char *data, int dataSize, int *compDataSize) @extern("CompressData");        // Compress data (DEFLATE algorithm), memory must be MemFree()
extern fn char *decompress_data(char *compData, int compDataSize, int *dataSize) @extern("DecompressData");  // Decompress data (DEFLATE algorithm), memory must be MemFree()
extern fn char *encode_data_base64(char *data, int dataSize, int *outputSize) @extern("EncodeDataBase64");               // Encode data to Base64 string, memory must be MemFree()
extern fn char *decode_data_base64(char *data, int *outputSize) @extern("DecodeDataBase64");                    // Decode Base64 string data, memory must be MemFree()

// Automation events functionality
extern fn AutomationEventList load_automation_event_list(char  *fileName) @extern("LoadAutomationEventList");                // Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
extern fn void unload_automation_event_list(AutomationEventList *list) @extern("UnloadAutomationEventList");                        // Unload automation events list from file
extern fn bool export_automation_event_list(AutomationEventList list, char  *fileName) @extern("ExportAutomationEventList");   // Export automation events list as text file
extern fn void set_automation_event_list(AutomationEventList *list) @extern("SetAutomationEventList");                           // Set automation event list to record to
extern fn void set_automation_event_base_frame(int frame) @extern("SetAutomationEventBaseFrame");                                      // Set automation event internal base frame to start recording
extern fn void start_automation_event_recording() @extern("StartAutomationEventRecording");                                         // Start recording automation events (AutomationEventList must be set)
extern fn void stop_automation_event_recording() @extern("StopAutomationEventRecording");                                          // Stop recording automation events
extern fn void play_automation_event(AutomationEvent event) @extern("PlayAutomationEvent");                                  // Play a recorded automation event

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard
extern fn bool is_key_pressed(KeyboardKey key) @extern("IsKeyPressed");                             // Check if a key has been pressed once
extern fn bool is_key_pressed_repeat(KeyboardKey key) @extern("IsKeyPressedRepeat");                       // Check if a key has been pressed again (Only PLATFORM_DESKTOP)
extern fn bool is_key_down(KeyboardKey key) @extern("IsKeyDown");                                // Check if a key is being pressed
extern fn bool is_key_released(KeyboardKey key) @extern("IsKeyReleased");                            // Check if a key has been released once
extern fn bool is_key_up(KeyboardKey key) @extern("IsKeyUp");                                  // Check if a key is NOT being pressed
extern fn int get_key_pressed() @extern("GetKeyPressed");                                // Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
extern fn int get_char_pressed() @extern("GetCharPressed");                               // Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
extern fn void set_exit_key(KeyboardKey key) @extern("SetExitKey");                               // Set a custom key to exit program (default is ESC)

// Input-related functions: gamepads
extern fn bool is_gamepad_available(int gamepad) @extern("IsGamepadAvailable");                   // Check if a gamepad is available
extern fn char *get_gamepad_name(int gamepad) @extern("GetGamepadName");                // Get gamepad internal name id
extern fn bool is_gamepad_button_pressed(int gamepad, GamepadButton button) @extern("IsGamepadButtonPressed");   // Check if a gamepad button has been pressed once
extern fn bool is_gamepad_button_down(int gamepad, GamepadButton button) @extern("IsGamepadButtonDown");      // Check if a gamepad button is being pressed
extern fn bool is_gamepad_button_released(int gamepad, GamepadButton button) @extern("IsGamepadButtonReleased");  // Check if a gamepad button has been released once
extern fn bool is_gamepad_button_up(int gamepad, GamepadButton button) @extern("IsGamepadButtonUp");        // Check if a gamepad button is NOT being pressed
extern fn int get_gamepad_button_pressed() @extern("GetGamepadButtonPressed");                      // Get the last gamepad button pressed
extern fn int get_gamepad_axis_count(int gamepad) @extern("GetGamepadAxisCount");                   // Get gamepad axis count for a gamepad
extern fn float get_gamepad_axis_movement(int gamepad, GamepadAxis axis) @extern("GetGamepadAxisMovement");    // Get axis movement value for a gamepad axis
extern fn int set_gamepad_mappings(char *mappings) @extern("SetGamepadMappings");           // Set internal gamepad mappings (SDL_GameControllerDB)

// Input-related functions: mouse
extern fn bool is_mouse_button_pressed(MouseButton button) @extern("IsMouseButtonPressed");                  // Check if a mouse button has been pressed once
extern fn bool is_mouse_button_down(MouseButton button) @extern("IsMouseButtonDown");                     // Check if a mouse button is being pressed
extern fn bool is_mouse_button_released(MouseButton button) @extern("IsMouseButtonReleased");                 // Check if a mouse button has been released once
extern fn bool is_mouse_button_up(MouseButton button) @extern("IsMouseButtonUp");                       // Check if a mouse button is NOT being pressed
extern fn int get_mouse_x() @extern("GetMouseX");                                    // Get mouse position X
extern fn int get_mouse_y() @extern("GetMouseY");                                    // Get mouse position Y
extern fn Vector2 get_mouse_position() @extern("GetMousePosition");                         // Get mouse position XY
extern fn Vector2 get_mouse_delta() @extern("GetMouseDelta");                            // Get mouse delta between frames
extern fn void set_mouse_position(int x, int y) @extern("SetMousePosition");                    // Set mouse position XY
extern fn void set_mouse_offset(int offsetX, int offsetY) @extern("SetMouseOffset");          // Set mouse offset
extern fn void set_mouse_scale(float scaleX, float scaleY) @extern("SetMouseScale");         // Set mouse scaling
extern fn float get_mouse_wheel_move() @extern("GetMouseWheelMove");                          // Get mouse wheel movement for X or Y, whichever is larger
extern fn Vector2 get_mouse_wheel_move_v() @extern("GetMouseWheelMoveV");                       // Get mouse wheel movement for both X and Y
extern fn void set_mouse_cursor(MouseCursor cursor) @extern("SetMouseCursor");                        // Set mouse cursor

// Input-related functions: touch
extern fn int get_touch_x() @extern("GetTouchX");                                    // Get touch position X for touch point 0 (relative to screen size)
extern fn int get_touch_y() @extern("GetTouchY");                                    // Get touch position Y for touch point 0 (relative to screen size)
extern fn Vector2 get_touch_position(int index) @extern("GetTouchPosition");                    // Get touch position XY for a touch point index (relative to screen size)
extern fn int get_touch_point_id(int index) @extern("GetTouchPointId");                         // Get touch point identifier for given index
extern fn int get_touch_point_count() @extern("GetTouchPointCount");                           // Get number of touch points

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------
extern fn void set_gestures_enabled(uint flags) @extern("SetGesturesEnabled");      // Enable a set of gestures using flags
extern fn bool is_gesture_detected(Gesture gesture) @extern("IsGestureDetected");     // Check if a gesture have been detected
extern fn int get_gesture_detected() @extern("GetGestureDetected");                     // Get latest detected gesture
extern fn float get_gesture_hold_duration() @extern("GetGestureHoldDuration");               // Get gesture hold time in milliseconds
extern fn Vector2 get_gesture_drag_vector() @extern("GetGestureDragVector");               // Get gesture drag vector
extern fn float get_gesture_drag_angle() @extern("GetGestureDragAngle");                  // Get gesture drag angle
extern fn Vector2 get_gesture_pinch_vector() @extern("GetGesturePinchVector");              // Get gesture pinch delta
extern fn float get_gesture_pinch_angle() @extern("GetGesturePinchAngle");                 // Get gesture pinch angle

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------
extern fn void update_camera(Camera *camera, CameraMode mode) @extern("UpdateCamera");      // Update camera position for selected mode
extern fn void update_camera_pro(Camera *camera, Vector3 movement, Vector3 rotation, float zoom) @extern("UpdateCameraPro"); // Update camera movement/rotation
extern fn void camera_yaw(Camera *camera, float angle, bool rotateAroundTarget) @extern("CameraYaw");
extern fn void camera_pitch(Camera *camera, float angle, bool lockView, bool rotateAroundTarget, bool rotateUp) @extern("CameraPitch");

///////////////////M O D U L E :  R S H A P E S ///////////////////////////////////////

// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call
extern fn void set_shapes_texture(Texture2D texture, Rectangle source) @extern("SetShapesTexture");       // Set texture and rectangle to be used on shapes drawing

// Basic shapes drawing functions
extern fn void draw_pixel(int posX, int posY, Color color) @extern("DrawPixel");                                                   // Draw a pixel
extern fn void draw_pixel_v(Vector2 position, Color color) @extern("DrawPixelV");                                                    // Draw a pixel (Vector version)
extern fn void draw_line(int startPosX, int startPosY, int endPosX, int endPosY, Color color) @extern("DrawLine");                // Draw a line
extern fn void draw_line_v(Vector2 startPos, Vector2 endPos, Color color) @extern("DrawLineV");                                     // Draw a line (using gl lines)
extern fn void draw_line_ex(Vector2 startPos, Vector2 endPos, float thick, Color color) @extern("DrawLineEx");                       // Draw a line (using triangles/quads)
extern fn void draw_line_strip(Vector2 *points, int pointCount, Color color) @extern("DrawLineStrip");                                  // Draw lines sequence (using gl lines)
extern fn void draw_line_bezier(Vector2 startPos, Vector2 endPos, float thick, Color color) @extern("DrawLineBezier");                   // Draw line segment cubic-bezier in-out interpolation
extern fn void draw_circle(int centerX, int centerY, float radius, Color color) @extern("DrawCircle");                              // Draw a color-filled circle
extern fn void draw_circle_sector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color) @extern("DrawCircleSector");      // Draw a piece of a circle
extern fn void draw_circle_sector_lines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color) @extern("DrawCircleSectorLines"); // Draw circle sector outline
extern fn void draw_circle_gradient(int centerX, int centerY, float radius, Color color1, Color color2) @extern("DrawCircleGradient");       // Draw a gradient-filled circle
extern fn void draw_circle_v(Vector2 center, float radius, Color color) @extern("DrawCircleV");                                       // Draw a color-filled circle (Vector version)
extern fn void draw_circle_lines(int centerX, int centerY, float radius, Color color) @extern("DrawCircleLines");                         // Draw circle outline
extern fn void draw_circle_lines_v(Vector2 center, float radius, Color color) @extern("DrawCircleLinesV");                                  // Draw circle outline (Vector version)
extern fn void draw_ellipse(int centerX, int centerY, float radiusH, float radiusV, Color color) @extern("DrawEllipse");             // Draw ellipse
extern fn void draw_ellipse_lines(int centerX, int centerY, float radiusH, float radiusV, Color color) @extern("DrawEllipseLines");        // Draw ellipse outline
extern fn void draw_ring(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color) @extern("DrawRing"); // Draw ring
extern fn void draw_ring_lines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color) @extern("DrawRingLines");    // Draw ring outline
extern fn void draw_rectangle(int posX, int posY, int width, int height, Color color) @extern("DrawRectangle");                        // Draw a color-filled rectangle
extern fn void draw_rectangle_v(Vector2 position, Vector2 size, Color color) @extern("DrawRectangleV");                                  // Draw a color-filled rectangle (Vector version)
extern fn void draw_rectangle_rec(Rectangle rec, Color color);                                                 // Draw a color-filled rectangle
extern fn void draw_rectangle_pro(Rectangle rec, Vector2 origin, float rotation, Color color);                 // Draw a color-filled rectangle with pro parameters
extern fn void draw_rectangle_gradient_V(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a vertical-gradient-filled rectangle
extern fn void draw_rectangle_gradientH(int posX, int posY, int width, int height, Color color1, Color color2);// Draw a horizontal-gradient-filled rectangle
extern fn void draw_rectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);       // Draw a gradient-filled rectangle with custom vertex colors
extern fn void draw_rectangle_lines(int posX, int posY, int width, int height, Color color) @extern("DrawRectangleLines");                   // Draw rectangle outline
extern fn void draw_rectangleLinesEx(Rectangle rec, float lineThick, Color color);                            // Draw rectangle outline with extended parameters
extern fn void draw_rectangleRounded(Rectangle rec, float roundness, int segments, Color color);              // Draw rectangle with rounded edges
extern fn void draw_rectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color); // Draw rectangle with rounded edges outline
extern fn void draw_triangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                // Draw a color-filled triangle (vertex in counter-clockwise order!)
extern fn void draw_triangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                           // Draw triangle outline (vertex in counter-clockwise order!)
extern fn void draw_triangleFan(Vector2 *points, int pointCount, Color color);                                // Draw a triangle fan defined by points (first vertex is the center)
extern fn void draw_triangleStrip(Vector2 *points, int pointCount, Color color);                              // Draw a triangle strip defined by points
extern fn void draw_poly(Vector2 center, int sides, float radius, float rotation, Color color);               // Draw a regular polygon (Vector version)
extern fn void draw_polyLines(Vector2 center, int sides, float radius, float rotation, Color color);          // Draw a polygon outline of n sides
extern fn void draw_polyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters

// Splines drawing functions
extern fn void draw_spline_linear(Vector2* points, int pointCount, float thick, Color color) @extern("DrawSplineLinear");
extern fn void draw_spline_basis(Vector2* points, int pointCount, float thick, Color color) @extern("DrawSplineBasis");
extern fn void draw_spline_catmull_rom(Vector2* points, int pointCount, float thick, Color color) @extern("DrawSplineCatmullRom");
extern fn void draw_spline_bezier_quadratic(Vector2* points, int pointCount, float thick, Color color) @extern("DrawSplineBezierQuadratic");
extern fn void draw_spline_bezier_cubic(Vector2* points, int pointCount, float thick, Color color) @extern("DrawSplineBezierCubic");
extern fn void draw_spline_segment_linear(Vector2 p1, Vector2 p2, float thick, Color color) @extern("DrawSplineSegmentLinear");
extern fn void draw_spline_segment_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentBasis");
extern fn void draw_spline_segment_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentCatmullRom");
extern fn void draw_spline_segment_bezier_quadratic(Vector2 p1, Vector2 c2, Vector2 p3, float thick, Color color) @extern("DrawSplineSegmentBezierQuadratic");
extern fn void draw_spline_segment_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float thick, Color color) @extern("DrawSplineSegmentBezierCubic");

// Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]
extern fn Vector2 get_spline_point_linear(Vector2 startPos, Vector2 endPos, float t) @extern("GetSplinePointLinear");
extern fn Vector2 get_spline_point_basis(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @extern("GetSplinePointBasis");
extern fn Vector2 get_spline_point_catmull_rom(Vector2 p1, Vector2 p2, Vector2 p3, Vector2 p4, float t) @extern("GetSplinePointCatmullRom");
extern fn Vector2 get_spline_point_bezier_quad(Vector2 p1, Vector2 c2, Vector2 p3, float t) @extern("GetSplinePointBezierQuad");
extern fn Vector2 get_spline_point_bezier_cubic(Vector2 p1, Vector2 c2, Vector2 c3, Vector2 p4, float t) @extern("GetSplinePointBezierCubic");

// Basic shapes collision detection functions
extern fn bool check_collision_recs(Rectangle rec1, Rectangle rec2) @extern("CheckCollisionRecs");
extern fn bool check_collision_circles(Vector2 center1, float radius1, Vector2 center2, float radius2) @extern("CheckCollisionCircles");
extern fn bool check_collision_circle_rec(Vector2 center, float radius, Rectangle rec) @extern("CheckCollisionCircleRec");
extern fn bool check_collision_point_rec(Vector2 point, Rectangle rec) @extern("CheckCollisionPointRec");
extern fn bool check_collision_point_circle(Vector2 point, Vector2 center, float radius) @extern("CheckCollisionPointCircle");
extern fn bool check_collision_point_triangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3) @extern("CheckCollisionPointTriangle");
extern fn bool check_collision_point_poly(Vector2 point, Vector2 *points, int pointCount) @extern("CheckCollisionPointPoly");
extern fn bool check_collision_lines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint) @extern("CheckCollisionLines");
extern fn bool check_collision_point_line(Vector2 point, Vector2 p1, Vector2 p2, int threshold) @extern("CheckCollisionPointLine");
extern fn Rectangle get_collision_rec(Rectangle rec1, Rectangle rec2) @extern("GetCollisionRec"); // Get collision rectangle for two rectangles collision



/////////////////////M O D U L E :  R T E X T U R E S  ///////////////////////////////////////

// Image loading functions
// NOTE: These functions do not require GPU access
extern fn Image load_image(char *fileName) @extern("LoadImage");
extern fn Image load_image_raw(char *fileName, int width, int height, int format, int headerSize) @extern("LoadImageRaw");
extern fn Image load_image_svg(char *fileNameOrString, int width, int height) @extern("LoadImageSvg");
extern fn Image load_image_anim(char *fileName, int *frames) @extern("LoadImageAnim");
extern fn Image load_image_from_memory(char *fileType, char *fileData, int dataSize) @extern("LoadImageFromMemory");
extern fn Image load_image_from_texture(Texture2D texture) @extern("LoadImageFromTexture");
extern fn Image load_image_from_screen() @extern("LoadImageFromScreen");
extern fn bool is_image_ready(Image image) @extern("IsImageReady");
extern fn void unload_image(Image image) @extern("UnloadImage");
extern fn bool export_image(Image image, char *fileName) @extern("ExportImage");
extern fn char *export_image_to_memory(Image image, char  *fileType, int *fileSize) @extern("ExportImageToMemory");
extern fn bool export_image_as_code(Image image, char  *fileName) @extern("ExportImageAsCode");

// Image generation functions
extern fn Image gen_image_color(int width, int height, Color color) @extern("GenImageColor");
extern fn Image gen_image_gradient_linear(int width, int height, int direction, Color start, Color end) @extern("GenImageGradientLinear");
extern fn Image gen_image_gradient_radial(int width, int height, float density, Color inner, Color outer) @extern("GenImageGradientRadial");
extern fn Image gen_image_gradient_square(int width, int height, float density, Color inner, Color outer) @extern("GenImageGradientSquare");
extern fn Image gen_image_checked(int width, int height, int checksX, int checksY, Color col1, Color col2) @extern("GenImageChecked");
extern fn Image gen_image_white_noise(int width, int height, float factor) @extern("GenImageWhiteNoise");
extern fn Image gen_image_perlin_noise(int width, int height, int offsetX, int offsetY, float scale) @extern("GenImagePerlinNoise");
extern fn Image gen_image_cellular(int width, int height, int tileSize) @extern("GenImageCellular");
extern fn Image gen_image_text(int width, int height, char  *text) @extern("GenImageText");

// Image manipulation functions
extern fn Image image_copy(Image image) @extern("ImageCopy");
extern fn Image image_from_image(Image image, Rectangle rec) @extern("ImageFromImage");
extern fn Image image_text(char  *text, int fontSize, Color color) @extern("ImageText");
extern fn Image image_text_ex(Font font, char  *text, float fontSize, float spacing, Color tint) @extern("ImageTextEx");
extern fn void image_format(Image *image, int newFormat) @extern("ImageFormat");
extern fn void image_to_pot(Image *image, Color fill) @extern("ImageToPOT");
extern fn void image_crop(Image *image, Rectangle crop) @extern("ImageCrop");
extern fn void image_alpha_crop(Image *image, float threshold) @extern("ImageAlphaCrop");
extern fn void image_alpha_clear(Image *image, Color color, float threshold) @extern("ImageAlphaClear");
extern fn void image_alpha_mask(Image *image, Image alphaMask) @extern("ImageAlphaMask");
extern fn void image_alpha_premultiply(Image *image) @extern("ImageAlphaPremultiply");
extern fn void image_blur_gaussian(Image *image, int blurSize) @extern("ImageBlurGaussian");
extern fn void image_resize(Image *image, int newWidth, int newHeight) @extern("ImageResize");
extern fn void image_resize_nn(Image *image, int newWidth, int newHeight) @extern("ImageResizeNN");
extern fn void image_resize_canvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill) @extern("ImageResizeCanvas");
extern fn void image_mipmaps(Image *image) @extern("ImageMipmaps");
extern fn void image_dither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp) @extern("ImageDither");
extern fn void image_flip_vertical(Image *image) @extern("ImageFlipVertical");
extern fn void image_flip_horizontal(Image *image) @extern("ImageFlipHorizontal");
extern fn void image_rotate(Image *image, int degrees) @extern("ImageRotate");
extern fn void image_rotate_cw(Image *image) @extern("ImageRotateCW");
extern fn void image_rotate_ccw(Image *image) @extern("ImageRotateCCW");
extern fn void image_color_tint(Image *image, Color color) @extern("ImageColorTint");
extern fn void image_color_invert(Image *image) @extern("ImageColorInvert");
extern fn void image_color_grayscale(Image *image) @extern("ImageColorGrayscale");
extern fn void image_color_contrast(Image *image, float contrast) @extern("ImageColorContrast");
extern fn void image_color_brightness(Image *image, int brightness) @extern("ImageColorBrightness");
extern fn void image_color_replace(Image *image, Color color, Color replace) @extern("ImageColorReplace");
extern fn Color *load_image_colors(Image image) @extern("LoadImageColors");
extern fn Color *load_image_palette(Image image, int maxPaletteSize, int *colorCount) @extern("LoadImagePalette");
extern fn void unload_image_colors(Color *colors) @extern("UnloadImageColors");
extern fn void unload_image_palette(Color *colors) @extern("UnloadImagePalette");
extern fn Rectangle get_image_alpha_border(Image image, float threshold) @extern("GetImageAlphaBorder");
extern fn Color get_image_color(Image image, int x, int y) @extern("GetImageColor");

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
extern fn void image_clear_background(Image *dst, Color color) @extern("ImageClearBackground");
extern fn void image_draw_pixel(Image *dst, int posX, int posY, Color color) @extern("ImageDrawPixel");
extern fn void image_draw_pixel_v(Image *dst, Vector2 position, Color color) @extern("ImageDrawPixelV");
extern fn void image_draw_line(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color) @extern("ImageDrawLine");
extern fn void image_draw_line_v(Image *dst, Vector2 start, Vector2 end, Color color) @extern("ImageDrawLineV");
extern fn void image_draw_circle(Image *dst, int centerX, int centerY, int radius, Color color) @extern("ImageDrawCircle");
extern fn void image_draw_circle_v(Image *dst, Vector2 center, int radius, Color color) @extern("ImageDrawCircleV");
extern fn void image_draw_circle_lines(Image *dst, int centerX, int centerY, int radius, Color color) @extern("ImageDrawCircleLines");
extern fn void image_draw_circle_lines_v(Image *dst, Vector2 center, int radius, Color color) @extern("ImageDrawCircleLinesV");
extern fn void image_draw_rectangle(Image *dst, int posX, int posY, int width, int height, Color color) @extern("ImageDrawRectangle");
extern fn void image_draw_rectangle_v(Image *dst, Vector2 position, Vector2 size, Color color) @extern("ImageDrawRectangleV");
extern fn void image_draw_rectangle_rec(Image *dst, Rectangle rec, Color color) @extern("ImageDrawRectangleRec");
extern fn void image_draw_rectangle_lines(Image *dst, Rectangle rec, int thick, Color color) @extern("ImageDrawRectangleLines");
extern fn void image_draw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint) @extern("ImageDraw");
extern fn void image_draw_text(Image *dst, char *text, int posX, int posY, int fontSize, Color color) @extern("ImageDrawText");
extern fn void image_draw_text_ex(Image *dst, Font font, char *text, Vector2 position, float fontSize, float spacing, Color tint) @extern("ImageDrawTextEx");

// Texture loading functions
// NOTE: These functions require GPU access
extern fn Texture2D load_texture(char  *fileName) @extern("LoadTexture");
extern fn Texture2D load_texture_from_image(Image image) @extern("LoadTextureFromImage");
extern fn TextureCubemap load_texture_cubemap(Image image, CubemapLayout layout) @extern("LoadTextureCubemap");
extern fn RenderTexture2D load_render_texture(int width, int height) @extern("LoadRenderTexture");
extern fn bool is_texture_ready(Texture2D texture) @extern("IsTextureReady");
extern fn void unload_texture(Texture2D texture) @extern("UnloadTexture");
extern fn void unload_render_texture(RenderTexture2D target) @extern("UnloadRenderTexture");
extern fn Color *load_texture_colors(Texture2D texture) @extern("LoadTextureColors");
extern fn Color *load_texture_palette(Texture2D texture, int maxPaletteSize, int *colorCount) @extern("LoadTexturePalette");
extern fn void unload_texture_colors(Color *colors) @extern("UnloadTextureColors");
extern fn void unload_texture_palette(Color *colors) @extern("UnloadTexturePalette");
extern fn void update_texture(Texture2D texture, void *pixels) @extern("UpdateTexture");
extern fn void update_texture_rec(Texture2D texture, Rectangle rec, void *pixels) @extern("UpdateTextureRec");

// Texture configuration functions
extern fn Image gen_texture_mipmaps(Texture2D *texture) @extern("GenTextureMipmaps");
extern fn void set_texture_filter(Texture2D texture, TextureFilter filter) @extern("SetTextureFilter");
extern fn void set_texture_wrap(Texture2D texture, TextureWrap wrap) @extern("SetTextureWrap");
// Texture drawing functions
extern fn void draw_texture(Texture2D texture, int posX, int posY, Color tint) @extern("DrawTexture");
extern fn void draw_texture_v(Texture2D texture, Vector2 position, Color tint) @extern("DrawTextureV");
extern fn void draw_texture_ex(Texture2D texture, Vector2 position, float rotation, float scale, Color tint) @extern("DrawTextureEx");
extern fn void draw_texture_rec(Texture2D texture, Rectangle source, Vector2 position, Color tint) @extern("DrawTextureRec");
extern fn void draw_texture_pro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint) @extern("DrawTexturePro");
extern fn void draw_texture_npatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint) @extern("DrawTextureNPatch");

// Color/pixel related functions
extern fn Color fade(Color color, float alpha) @extern("Fade");                                 // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern fn int color_to_int(Color color) @extern("ColorToInt");                                          // Get hexadecimal value for a Color
extern fn Vector4 color_normalize(Color color) @extern("ColorNormalize");                                  // Get Color normalized as float [0..1]
extern fn Color color_from_normalized(Vector4 normalized) @extern("ColorFromNormalized");                        // Get Color from normalized values [0..1]
extern fn Vector3 color_to_hsv(Color color) @extern("ColorToHSV");                                      // Get HSV values for a Color, hue [0..360], saturation/value [0..1]
extern fn Color color_from_hsv(float hue, float saturation, float value) @extern("ColorFromHSV");         // Get a Color from HSV values, hue [0..360], saturation/value [0..1]
extern fn Color color_tint(Color color, Color tint) @extern("ColorTint");                             // Get color multiplied with another color
extern fn Color color_brightness(Color color, float factor) @extern("Fade");                     // Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
extern fn Color color_contrast(Color color, float contrast) @extern("ColorContrast");                     // Get color with contrast correction, contrast values between -1.0f and 1.0f
extern fn Color color_alpha(Color color, float alpha) @extern("ColorAlpha");                           // Get color with alpha applied, alpha goes from 0.0f to 1.0f
extern fn Color color_alpha_blend(Color dst, Color src, Color tint) @extern("ColorAlphaBlend");              // Get src alpha-blended into dst color with tint
extern fn Color get_color(uint hexValue) @extern("GetColor");                                // Get Color structure from hexadecimal value
extern fn Color get_pixel_color(void *srcPtr, int format) @extern("GetPixelColor");                        // Get Color from a source pixel pointer of certain format
extern fn void set_pixel_color(void *dstPtr, Color color, int format) @extern("SetPixelColor");            // Set color formatted into destination pixel pointer
extern fn int get_pixel_data_size(int width, int height, int format) @extern("GetPixelDataSize");              // Get pixel data size in bytes for certain format

/////////////////////M O D U L E :  R T E X T  ///////////////////////////////////////
// Font loading/unloading functions
extern fn Font get_font_default() @extern("GetFontDefault");                                                            // Get the default Font
extern fn Font load_font(char *fileName) @extern("LoadFont");                                                  // Load font from file into GPU memory (VRAM)
extern fn Font load_font_ex(char *fileName, int fontSize, int *codepoints, int codepointCount) @extern("LoadFontEx");  // Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set
extern fn Font load_font_from_image(Image image, Color key, int firstChar) @extern("LoadFontFromImage");                        // Load font from Image (XNA style)
extern fn Font load_font_from_memory(char *fileType, ichar *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount) @extern("LoadFontFromMemory"); // Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
extern fn bool is_font_ready(Font font) @extern("IsFontReady");                                                          // Check if a font is ready
extern fn GlyphInfo *load_font_data(ichar *fileData, int dataSize, int fontSize, int *codepoints, int codepointCount, int type) @extern("LoadFontData"); // Load font data for further use
extern fn Image gen_image_font_atlas(GlyphInfo *glyphs, Rectangle **glyphRecs, int glyphCount, int fontSize, int padding, int packMethod) @extern("GenImageFontAtlas"); // Generate image font atlas using chars info
extern fn void unload_font_data(GlyphInfo *glyphs, int glyphCount) @extern("UnloadFontData");                               // Unload font chars info data (RAM)
extern fn void unload_font(Font font) @extern("UnloadFont");                                                           // Unload font from GPU memory (VRAM)
extern fn bool export_font_as_code(Font font, char *fileName) @extern("ExportFontAsCode");                               // Export font as code file, returns true on success

// Text drawing functions
extern fn void draw_fps(int posX, int posY) @extern("DrawFPS");                                                     // Draw current FPS
extern fn void draw_text(char *text, int posX, int posY, int fontSize, Color color) @extern("DrawText");       // Draw text (using default font)
extern fn void draw_text_ex(Font font, char *text, Vector2 position, float fontSize, float spacing, Color tint) @extern("DrawTextEx"); // Draw text using font and additional parameters
extern fn void draw_text_pro(Font font, char *text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint) @extern("DrawTextPro"); // Draw text using Font and pro parameters (rotation)
extern fn void draw_text_codepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint) @extern("DrawTextCodepoint"); // Draw one character (codepoint)
extern fn void draw_text_codepoints(Font font, int *codepoints, int codepointCount, Vector2 position, float fontSize, float spacing, Color tint) @extern("DrawTextCodepoints"); // Draw multiple character (codepoint)

// Text font info functions
extern fn void set_text_line_spacing(int spacing) @extern("SetTextLineSpacing");                                                 // Set vertical line spacing when drawing with line-breaks
extern fn int measure_text(char *text, int fontSize) @extern("MeasureText");                                      // Measure string width for default font
extern fn Vector2 measure_text_ex(Font font, char *text, float fontSize, float spacing) @extern("MeasureTextEx");    // Measure string size for Font
extern fn int get_glyph_index(Font font, int codepoint) @extern("GetGlyphIndex");                                          // Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
extern fn GlyphInfo get_glyph_info(Font font, int codepoint) @extern("GetGlyphInfo");                                     // Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
extern fn Rectangle get_glyph_atlas_rec(Font font, int codepoint) @extern("GetGlyphAtlasRec");                                 // Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found

// Text codepoints management functions (unicode characters)
extern fn char *load_utf8(int *codepoints, int length) @extern("LoadUTF8");                // Load UTF-8 text encoded from codepoints array
extern fn void unload_utf8(char *text) @extern("UnloadUTF8");                                      // Unload UTF-8 text encoded from codepoints array
extern fn int *load_codepoints(char *text, int *count) @extern("LoadCodepoints");                // Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
extern fn void unload_codepoints(int *codepoints) @extern("UnloadCodepoints");                           // Unload codepoints data from memory
extern fn int get_codepoint_count(char *text) @extern("GetCodepointCount");                          // Get total number of codepoints in a UTF-8 encoded string
extern fn int get_codepoint(char *text, int *codepointSize) @extern("GetCodepoint");           // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern fn int get_codepoint_next(char *text, int *codepointSize) @extern("GetCodepointNext");       // Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern fn int get_codepoint_previous(char *text, int *codepointSize) @extern("GetCodepointPrevious");   // Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
extern fn char *codepoint_to_utf8(int codepoint, int *utf8Size) @extern("CodepointToUTF8");        // Encode one codepoint into UTF-8 byte array (array length returned as parameter)

// Text strings management functions (no UTF-8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
extern fn int text_copy(char *dst, char *src) @extern("TextCopy");                                             // Copy one string to another, returns bytes copied
extern fn bool text_is_equal(char *text1, char *text2) @extern("TextIsEqual");                               // Check if two text string are equal
extern fn uint text_length(char *text) @extern("TextLength");                                            // Get text length, checks for '\0' ending
extern fn char *text_format(char *text, ...) @extern("TextFormat");                                        // Text formatting with variables (sprintf() style)
extern fn char *text_subtext(char *text, int position, int length) @extern("TextSubtext");                  // Get a piece of a text string
extern fn char *text_replace(char *text, char *replace, char *by) @extern("TextReplace");                   // Replace text string (WARNING: memory must be freed!)
extern fn char *text_insert(char *text, char *insert, int position) @extern("TextInsert");                 // Insert text in a position (WARNING: memory must be freed!)
extern fn char *text_join(char **textList, int count, char *delimiter) @extern("TextJoin");        // Join text strings with delimiter
extern fn char **text_split(char *text, char delimiter, int *count) @extern("TextSplit");                 // Split text into multiple strings
extern fn void text_append(char *text, char *append, int *position) @extern("TextAppend");                       // Append text at specific position and move cursor!
extern fn int text_find_index(char *text, char *find) @extern("TextFindIndex");                                // Find first text occurrence within a string
extern fn char *text_to_upper(char *text) @extern("TextToUpper");                      // Get upper case version of provided string
extern fn char *text_to_lower(char *text) @extern("TextToLower");                      // Get lower case version of provided string
extern fn char *text_to_pascal(char *text) @extern("TextToPascal");                     // Get Pascal case notation version of provided string
extern fn int text_to_integer(char *text) @extern("TextToInteger");                            // Get integer value from text (negative values not supported)


/////////////////////M O D U L E :  R M O D E L S ///////////////////////////////////////
// Basic geometric 3D shapes drawing functions
extern fn void draw_line_3d(Vector3 startPos, Vector3 endPos, Color color) @extern("DrawLine3D");
extern fn void draw_point_3d(Vector3 position, Color color) @extern("DrawPoint3D");
extern fn void draw_circle_3d(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color) @extern("DrawCircle3D");
extern fn void draw_triangle_3d(Vector3 v1, Vector3 v2, Vector3 v3, Color color) @extern("DrawTriangle3D");
extern fn void draw_triangle_strip_3d(Vector3 *points, int pointCount, Color color) @extern("DrawTriangleStrip3D");
extern fn void draw_cube(Vector3 position, float width, float height, float length, Color color) @extern("DrawCube");
extern fn void draw_cube_v(Vector3 position, Vector3 size, Color color) @extern("DrawCubeV");
extern fn void draw_cube_wires(Vector3 position, float width, float height, float length, Color color) @extern("DrawCubeWires");
extern fn void draw_cube_wires_v(Vector3 position, Vector3 size, Color color) @extern("DrawCubeWiresV");
extern fn void draw_sphere(Vector3 centerPos, float radius, Color color) @extern("DrawSphere");
extern fn void draw_sphere_ex(Vector3 centerPos, float radius, int rings, int slices, Color color) @extern("DrawSphereEx");
extern fn void draw_sphere_wires(Vector3 centerPos, float radius, int rings, int slices, Color color) @extern("DrawSphereWires");
extern fn void draw_cylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color) @extern("DrawCylinder");
extern fn void draw_cylinder_ex(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color) @extern("DrawCylinderEx");
extern fn void draw_cylinder_wires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color) @extern("DrawCylinderWires");
extern fn void draw_cylinder_wires_ex(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color) @extern("DrawCylinderWiresEx");
extern fn void draw_capsule(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color) @extern("DrawCapsule");
extern fn void draw_capsule_wires(Vector3 startPos, Vector3 endPos, float radius, int slices, int rings, Color color) @extern("DrawCapsuleWires");
extern fn void draw_plane(Vector3 centerPos, Vector2 size, Color color) @extern("DrawPlane");
extern fn void draw_ray(Ray ray, Color color) @extern("DrawRay");
extern fn void draw_grid(int slices, float spacing) @extern("DrawGrid");

// Model 3D Loading and Drawing Functions (Module: models)

// Model management functions
extern fn Model load_model(char  *fileName) @extern("LoadModel");
extern fn Model load_model_from_mesh(Mesh mesh) @extern("LoadModelFromMesh");
extern fn bool is_model_ready(Model model) @extern("IsModelReady");
extern fn void unload_model(Model model) @extern("UnloadModel");
extern fn BoundingBox get_model_bounding_box(Model model) @extern("GetModelBoundingBox");

// Model drawing functions
extern fn void draw_model(Model model, Vector3 position, float scale, Color tint) @extern("DrawModel");
extern fn void draw_model_ex(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint) @extern("DrawModelEx");
extern fn void draw_model_wires(Model model, Vector3 position, float scale, Color tint) @extern("DrawModelWires");
extern fn void draw_model_wires_ex(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint) @extern("DrawModelWiresEx");
extern fn void draw_bounding_box(BoundingBox box, Color color) @extern("DrawBoundingBox");
extern fn void draw_billboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint) @extern("DrawBillboard");
extern fn void draw_billboard_rec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint) @extern("DrawBillboardRec");
extern fn void draw_billboard_pro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint) @extern("DrawBillboardPro");

// Mesh management functions
extern fn void upload_mesh(Mesh *mesh, bool dynamic) @extern("UploadMesh");
extern fn void update_mesh_buffer(Mesh mesh, int index, void *data, int dataSize, int offset) @extern("UpdateMeshBuffer");
extern fn void unload_mesh(Mesh mesh) @extern("UnloadMesh");
extern fn void draw_mesh(Mesh mesh, Material material, Matrix transform) @extern("DrawMesh");
extern fn void draw_mesh_instanced(Mesh mesh, Material material, Matrix *transforms, int instances) @extern("DrawMeshInstanced");
extern fn bool export_mesh(Mesh mesh, char  *fileName) @extern("ExportMesh");
extern fn BoundingBox get_mesh_bounding_box(Mesh mesh) @extern("GetMeshBoundingBox");
extern fn void gen_mesh_tangents(Mesh *mesh) @extern("GenMeshTangents");

// Mesh generation functions
extern fn Mesh gen_mesh_poly(int sides, float radius) @extern("GenMeshPoly");
extern fn Mesh gen_mesh_plane(float width, float length, int resX, int resZ) @extern("GenMeshPlane");
extern fn Mesh gen_mesh_cube(float width, float height, float length) @extern("GenMeshCube");
extern fn Mesh gen_mesh_sphere(float radius, int rings, int slices) @extern("GenMeshSphere");
extern fn Mesh gen_mesh_hemisphere(float radius, int rings, int slices) @extern("GenMeshHemiSphere");
extern fn Mesh gen_mesh_cylinder(float radius, float height, int slices) @extern("GenMeshCylinder");
extern fn Mesh gen_mesh_cone(float radius, float height, int slices) @extern("GenMeshCone");
extern fn Mesh gen_mesh_torus(float radius, float size, int radSeg, int sides) @extern("GenMeshTorus");
extern fn Mesh gen_mesh_knot(float radius, float size, int radSeg, int sides) @extern("GenMeshKnot");
extern fn Mesh gen_mesh_heightmap(Image heightmap, Vector3 size) @extern("GenMeshHeightmap");
extern fn Mesh gen_mesh_cubicmap(Image cubicmap, Vector3 cubeSize) @extern("GenMeshCubicmap");

// Material loading/unloading functions
extern fn Material *load_materials(char  *fileName, int *materialCount) @extern("LoadMaterials");
extern fn Material load_material_default() @extern("LoadMaterialDefault");
extern fn bool is_material_ready(Material material) @extern("IsMaterialReady");
extern fn void unload_material(Material material) @extern("UnloadMaterial");
extern fn void set_material_texture(Material *material, int mapType, Texture2D texture) @extern("SetMaterialTexture");
extern fn void set_model_mesh_material(Model *model, int meshId, int materialId) @extern("SetModelMeshMaterial");

// Model animations loading/unloading functions
extern fn ModelAnimation *load_model_animations(char  *fileName, int *animCount) @extern("LoadModelAnimations");
extern fn void update_model_animation(Model model, ModelAnimation anim, int frame) @extern("UpdateModelAnimation");
extern fn void unload_model_animation(ModelAnimation anim) @extern("UnloadModelAnimation");
extern fn void unload_model_animations(ModelAnimation *animations, int animCount) @extern("UnloadModelAnimations");
extern fn bool is_model_animation_valid(Model model, ModelAnimation anim) @extern("IsModelAnimationValid");

// Collision detection functions
extern fn bool check_collision_spheres(Vector3 center1, float radius1, Vector3 center2, float radius2) @extern("CheckCollisionSpheres");
extern fn bool check_collision_boxes(BoundingBox box1, BoundingBox box2) @extern("CheckCollisionBoxes");
extern fn bool check_collision_box_sphere(BoundingBox box, Vector3 center, float radius) @extern("CheckCollisionBoxSphere");
extern fn RayCollision get_ray_collision_sphere(Ray ray, Vector3 center, float radius) @extern("GetRayCollisionSphere");
extern fn RayCollision get_ray_collision_box(Ray ray, BoundingBox box) @extern("GetRayCollisionBox");
extern fn RayCollision get_ray_collision_mesh(Ray ray, Mesh mesh, Matrix transform) @extern("GetRayCollisionMesh");
extern fn RayCollision get_ray_collision_triangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3) @extern("GetRayCollisionTriangle");
extern fn RayCollision get_ray_collision_quad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) @extern("GetRayCollisionQuad");


/////////////////////M O D U L E :  R A U D I O ///////////////////////////////////////
// Audio device management functions
def AudioCallback = fn void (void *bufferData, uint frames);
extern fn void init_audio_device() @extern("InitAudioDevice");                                     // Initialize audio device and context
extern fn void close_audio_device() @extern("CloseAudioDevice");                                    // Close the audio device and context
extern fn bool is_audio_device_ready() @extern("IsAudioDeviceReady");                                  // Check if audio device has been initialized successfully
extern fn void set_master_volume(float volume) @extern("SetMasterVolume");                             // Set master volume (listener)
extern fn float get_master_volume() @extern("GetMasterVolume");                                    // Get master volume (listener)

// Wave/Sound loading/unloading functions
extern fn Wave load_wave(char *fileName) @extern("LoadWave");                            // Load wave data from file
extern fn Wave load_wave_from_memory(char *fileType, char *fileData, int dataSize) @extern("LoadWaveFromMemory"); // Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
extern fn bool is_wave_ready(Wave wave) @extern("IsWaveReady");                                    // Checks if wave data is ready
extern fn Sound load_sound(char *fileName) @extern("LoadSound");                          // Load sound from file
extern fn Sound load_sound_from_wave(Wave wave) @extern("LoadSoundFromWave");                             // Load sound from wave data
extern fn Sound load_sound_alias(Sound source) @extern("LoadSoundAlias");                             // Create a new sound that shares the same sample data as the source sound, does not own the sound data
extern fn bool is_sound_ready(Sound sound) @extern("IsSoundReady");                                 // Checks if a sound is ready
extern fn void update_sound(Sound sound, void *data, int sampleCount) @extern("UpdateSound"); // Update sound buffer with new data
extern fn void unload_wave(Wave wave) @extern("UnloadWave");                                     // Unload wave data
extern fn void unload_sound(Sound sound) @extern("UnloadSound");                                  // Unload sound
extern fn void unload_sound_alias(Sound alias) @extern("UnloadSoundAlias");                             // Unload a sound alias (does not deallocate sample data)
extern fn bool export_wave(Wave wave, char *fileName) @extern("ExportWave");               // Export wave data to file, returns true on success
extern fn bool export_wave_as_code(Wave wave, char *fileName) @extern("ExportWaveAsCode");         // Export wave sample data to code (.h), returns true on success

// Wave/Sound management functions
extern fn void play_sound(Sound sound) @extern("PlaySound");                                    // Play a sound
extern fn void stop_sound(Sound sound) @extern("StopSound");                                    // Stop playing a sound
extern fn void pause_sound(Sound sound) @extern("PauseSound");                                   // Pause a sound
extern fn void resume_sound(Sound sound) @extern("ResumeSound");                                  // Resume a paused sound
extern fn bool is_sound_playing(Sound sound) @extern("IsSoundPlaying");                               // Check if a sound is currently playing
extern fn void set_sound_volume(Sound sound, float volume) @extern("SetSoundVolume");                 // Set volume for a sound (1.0 is max level)
extern fn void set_sound_pitch(Sound sound, float pitch) @extern("SetSoundPitch");                   // Set pitch for a sound (1.0 is base level)
extern fn void set_sound_pan(Sound sound, float pan) @extern("SetSoundPan");                       // Set pan for a sound (0.5 is center)
extern fn Wave wave_copy(Wave wave) @extern("WaveCopy");                                       // Copy a wave to a new wave
extern fn void wave_crop(Wave *wave, int initSample, int finalSample) @extern("WaveCrop");     // Crop a wave to defined samples range
extern fn void wave_format(Wave *wave, int sampleRate, int sampleSize, int channels) @extern("WaveFormat"); // Convert wave data to desired format
extern fn float *load_wave_samples(Wave wave) @extern("LoadWaveSamples");                              // Load samples data from wave as a 32bit float data array
extern fn void unload_wave_samples(float *samples) @extern("UnloadWaveSamples");                         // Unload samples data loaded with LoadWaveSamples()

// Music management functions
extern fn Music load_music_stream(char  *fileName) @extern("LoadMusicStream");                    // Load music stream from file
extern fn Music load_music_stream_from_memory(char  *fileType, char *data, int dataSize) @extern("LoadMusicStreamFromMemory"); // Load music stream from data
extern fn bool is_music_ready(Music music) @extern("IsMusicReady");                                 // Checks if a music stream is ready
extern fn void unload_music_stream(Music music) @extern("UnloadMusicStream");                            // Unload music stream
extern fn void play_music_stream(Music music) @extern("PlayMusicStream");                              // Start music playing
extern fn bool is_music_stream_playing(Music music) @extern("IsMusicStreamPlaying");                         // Check if music is playing
extern fn void update_music_stream(Music music) @extern("UpdateMusicStream");                            // Updates buffers for music streaming
extern fn void stop_music_stream(Music music) @extern("StopMusicStream");                              // Stop music playing
extern fn void pause_music_stream(Music music) @extern("PauseMusicStream");                             // Pause music playing
extern fn void resume_music_stream(Music music) @extern("ResumeMusicStream");                            // Resume playing paused music
extern fn void seek_music_stream(Music music, float position) @extern("SeekMusicStream");              // Seek music to a position (in seconds)
extern fn void set_music_volume(Music music, float volume) @extern("SetMusicVolume");                 // Set volume for music (1.0 is max level)
extern fn void set_music_pitch(Music music, float pitch) @extern("SetMusicPitch");                   // Set pitch for a music (1.0 is base level)
extern fn void set_music_pan(Music music, float pan) @extern("SetMusicPan");                       // Set pan for a music (0.5 is center)
extern fn float get_music_time_length(Music music) @extern("GetMusicTimeLength");                          // Get music time length (in seconds)
extern fn float get_music_time_played(Music music) @extern("GetMusicTimePlayed");                          // Get current music time played (in seconds)

// AudioStream management functions
extern fn AudioStream load_audio_stream(uint sampleRate, uint sampleSize, uint channels) @extern("LoadAudioStream"); // Load audio stream (to stream raw audio pcm data)
extern fn bool is_audio_stream_ready(AudioStream stream) @extern("IsAudioStreamReady");                    // Checks if an audio stream is ready
extern fn void unload_audio_stream(AudioStream stream) @extern("UnloadAudioStream");                     // Unload audio stream and free memory
extern fn void update_audio_stream(AudioStream stream, void *data, int frameCount) @extern("UpdateAudioStream"); // Update audio stream buffers with data
extern fn bool is_audio_stream_processed(AudioStream stream) @extern("IsAudioStreamProcessed");                // Check if any audio stream buffers requires refill
extern fn void play_audio_stream(AudioStream stream) @extern("PlayAudioStream");                       // Play audio stream
extern fn void pause_audio_stream(AudioStream stream) @extern("PauseAudioStream");                      // Pause audio stream
extern fn void resume_audio_stream(AudioStream stream) @extern("ResumeAudioStream");                     // Resume audio stream
extern fn bool is_audio_stream_playing(AudioStream stream) @extern("IsAudioStreamPlaying");                  // Check if audio stream is playing
extern fn void stop_audio_stream(AudioStream stream) @extern("StopAudioStream");                       // Stop audio stream
extern fn void set_audio_stream_volume(AudioStream stream, float volume) @extern("SetAudioStreamVolume");    // Set volume for audio stream (1.0 is max level)
extern fn void set_audio_stream_pitch(AudioStream stream, float pitch)  @extern("SetAudioStreamPitch");      // Set pitch for audio stream (1.0 is base level)
extern fn void set_audio_stream_pan(AudioStream stream, float pan)  @extern("SetAudioStreamPan");          // Set pan for audio stream (0.5 is centered)
extern fn void set_audio_stream_bufferSizeDefault(int size) @extern("SetAudioStreamBufferSizeDefault");                 // Default size for new audio streams
extern fn void set_audio_stream_callback(AudioStream stream, AudioCallback callback) @extern("SetAudioStreamCallback"); // Audio thread callback to request new data

extern fn void attach_audio_stream_processor(AudioStream stream, AudioCallback processor) @extern("AttachAudioStreamProcessor"); // Attach audio stream processor to stream, receives the samples as s
extern fn void detach_audio_stream_processor(AudioStream stream, AudioCallback processor) @extern("DetachAudioStreamProcessor"); // Detach audio stream processor from stream

extern fn void attach_audio_mixed_processor(AudioCallback processor) @extern("AttachAudioMixedProcessor"); // Attach audio stream processor to the entire audio pipeline, receives the samples as s
extern fn void detach_audio_mixed_processor(AudioCallback processor) @extern("DetachAudioMixedProcessor"); // Detach audio stream processor from the entire audio pipeline



///////////////////// S T R U C T S ///////////////////////////////////////
def Vector2 = float[<2>];             // Vector2, 2 components
def Vector3 = float[<3>];
def Vector4 = float[<4>];             // Vector4, 4 components
def Quaternion = Vector4;
// Matrix, 4x4 components, column major, OpenGL style, right handed
struct Matrix{
    float m0, m4, m8, m12;  // Matrix first row (4 components)
    float m1, m5, m9, m13;  // Matrix second row (4 components)
    float m2, m6, m10, m14; // Matrix third row (4 components)
    float m3, m7, m11, m15; // Matrix fourth row (4 components)
}                 

// Color, 4 components, R8G8B8A8 (32bit)
def Color = char[<4>]; 

// Rectangle, 4 components                
struct Rectangle{
    float x;
    float y;
    float width;
    float height;
}              

// Image, pixel data stored in CPU memory (RAM)
struct Image{
    void *data;             // Image raw data
    int width;              // Image base width
    int height;             // Image base height
    int mipmaps;            // Mipmap levels, 1 by default
    PixelFormat format;     // Data format (PixelFormat type)
}                  

// Texture, tex data stored in GPU memory (VRAM)
struct Texture{
    uint id;                // OpenGL texture id
    int width;              // Texture base width
    int height;             // Texture base height
    int mipmaps;            // Mipmap levels, 1 by default
    PixelFormat format;     // Data format (PixelFormat type)
}                

// Texture2D, same as Texture
def Texture2D = Texture;

// TextureCubemap, same as Texture
def TextureCubemap = Texture;

struct RenderTexture{
    uint id;        // OpenGL framebuffer object id
    Texture texture;        // Color buffer attachment texture
    Texture depth;          // Depth buffer attachment texture
}          // RenderTexture, fbo for texture rendering

def RenderTexture2D = RenderTexture;

// NPatchInfo, n-patch layout info
struct NPatchInfo{
    Rectangle source;       // Texture source rectangle
    int left;               // Left border offset
    int top;                // Top border offset
    int right;              // Right border offset
    int bottom;             // Bottom border offset
    NPatchLayout layout;    // Layout of the n-patch: 3x3, 1x3 or 3x1
}             

// GlyphInfo, font characters glyphs info
struct GlyphInfo{   
    int value;              // Character value (Unicode)
    int offsetX;            // Character offset X when drawing
    int offsetY;            // Character offset Y when drawing
    int advanceX;           // Character advance position X
    Image image;            // Character image data
}              
struct Font{
    int baseSize;           // Base size (default chars height)
    int glyphCount;         // Number of glyph characters
    int glyphPadding;       // Padding around the glyph characters
    Texture2D texture;      // Texture atlas containing the glyphs
    Rectangle *recs;        // Rectangles in texture for the glyphs
    GlyphInfo *glyphs;      // Glyphs info data
}                   // Font, font texture and GlyphInfo array data

// Camera, defines position/orientation in 3d space
struct Camera3D{ 
    Vector3 position;               // Camera position
    Vector3 target;                 // Camera target it looks-at
    Vector3 up;                     // Camera up vector (rotation over its axis)
    float fovy;                     // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    CameraProjection projection;    // Camera projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
}

// Camera2D, defines position/orientation in 2d space
struct Camera2D{
    Vector2 offset;         // Camera offset (displacement from target)
    Vector2 target;         // Camera target (rotation and zoom origin)
    float rotation;         // Camera rotation in degrees
    float zoom;             // Camera zoom (scaling), should be 1.0f by default
}               

def Camera = Camera3D; // Camera type fallback, defaults to Camera3D

enum CameraProjection : int {
    CAMERA_PERSPECTIVE,
    CAMERA_ORTHOGRAPHIC 
} 

enum CameraMode : int {
        CAMERA_CUSTOM,      // Camera custom, controlled by user (UpdateCamera() does nothing)
        CAMERA_FREE,            // Camera free mode
        CAMERA_ORBITAL,         // Camera orbital, around target, zoom supported
        CAMERA_FIRST_PERSON,    // Camera first person
        CAMERA_THIRD_PERSON     // Camera third person
}

struct Mesh{
    int vertexCount;        // Number of vertices stored in arrays
    int triangleCount;      // Number of triangles stored (indexed or not)

    // Vertex attributes data
    float *vertices;        // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float *texcoords;       // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float *texcoords2;      // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    float *normals;         // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    float *tangents;        // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    char *colors;      // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    ushort *indices;    // Vertex indices (in case vertex data comes indexed)

    // Animation vertex data
    float *animVertices;    // Animated vertex positions (after bones transformations)
    float *animNormals;     // Animated normals (after bones transformations)
    char *boneIds; // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
    float *boneWeights;     // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    // OpenGL identifiers
    uint vaoId;     // OpenGL Vertex Array Object id
    uint *vboId;    // OpenGL Vertex Buffer Objects id (default vertex data)
}                   // Mesh, vertex data and vao/vbo
struct Shader{
    uint id;        // Shader program id
    int *locs;              // Shader locations array (RL_MAX_SHADER_LOCATIONS)
}                 // Shader
// MaterialMap
struct MaterialMap{
    Texture2D texture;      // Material map texture
    Color color;            // Material map color
    float value;            // Material map value
}            
struct Material{
    Shader shader;          // Material shader
    MaterialMap* maps;      // Material maps array (MAX_MATERIAL_MAPS)
    float[4] params;        // Material generic parameters (if required)
}               // Material, includes shader and maps
struct Transform{
    Vector3 translation;    // Translation
    Quaternion rotation;    // Rotation
    Vector3 scale;          // Scale
}              // Transform, vertex transformation data
struct BoneInfo{
    char[32] name;          // Bone name
    int parent;             // Bone parent
}               // Bone, skeletal animation bone
struct Model{
    Matrix transform;       // Local transform matrix

    int meshCount;          // Number of meshes
    int materialCount;      // Number of materials
    Mesh* meshes;           // Meshes array
    Material* materials;    // Materials array
    int* meshMaterial;      // Mesh material number

    // Animation data
    int boneCount;          // Number of bones
    BoneInfo* bones;        // Bones information (skeleton)
    Transform* bindPose;    // Bones base transformation (pose)
}                  // Model, meshes, materials and animation data
struct ModelAnimation{
    int boneCount;          // Number of bones
    int frameCount;         // Number of animation frames
    BoneInfo* bones;        // Bones information (skeleton)
    Transform** framePoses; // Poses array by frame
    char[32] name;          // Animation name
}         // ModelAnimation
struct Ray{
    Vector3 position;       // Ray position (origin)
    Vector3 direction;      // Ray direction (normalized)
}                    // Ray, ray for raycasting
struct RayCollision{
    bool hit;               // Did the ray hit something?
    float distance;         // Distance to the nearest hit
    Vector3 point;          // Point of the nearest hit
    Vector3 normal;         // Surface normal of hit
}           // RayCollision, ray hit information
struct BoundingBox{
    Vector3 min;            // Minimum vertex box-corner
    Vector3 max;            // Maximum vertex box-corner
}            // BoundingBox

struct Wave{
    uint frameCount;    // Total number of frames (considering channels)
    uint sampleRate;    // Frequency (samples per second)
    uint sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    uint channels;      // Number of channels (1-mono, 2-stereo, ...)
    void* data;                 // Buffer data pointer
}                   // Wave, audio wave data

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
distinct RAudioBuffer = void*;
distinct RAudioProcessor = void*; 

struct AudioStream{
    RAudioBuffer* buffer;       // Pointer to internal data used by the audio system
    RAudioProcessor* processor; // Pointer to internal data processor, useful for audio effects

    uint sampleRate;    // Frequency (samples per second)
    uint sampleSize;    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    uint channels;      // Number of channels (1-mono, 2-stereo, ...)
}            // AudioStream, custom audio stream
struct Sound{
    AudioStream stream;         // Audio stream
    uint frameCount;    // Total number of frames (considering channels)
}                  // Sound
struct Music{
    AudioStream stream;         // Audio stream
    uint frameCount;    // Total number of frames (considering channels)
    bool looping;               // Music looping enable

    int ctxType;                // Type of music context (audio filetype)
    void* ctxData;              // Audio context data, depends on type
}                  // Music, audio stream, anything longer than ~10 seconds should be streamed

struct VrDeviceInfo{
    int hResolution;                // Horizontal resolution in pixels
    int vResolution;                // Vertical resolution in pixels
    float hScreenSize;              // Horizontal size in meters
    float vScreenSize;              // Vertical size in meters
    float eyeToScreenDistance;      // Distance between eye and display in meters
    float lensSeparationDistance;   // Lens separation distance in meters
    float interpupillaryDistance;   // IPD (distance between pupils) in meters
    float[4] lensDistortionValues;  // Lens distortion constant parameters
    float[4] chromaAbCorrection;    // Chromatic aberration correction parameters
}           // VrDeviceInfo, Head-Mounted-Display device parameters
struct VrStereoConfig{
    Matrix[2] projection;           // VR projection matrices (per eye)
    Matrix[2] viewOffset;           // VR view offset matrices (per eye)
    float[2] leftLensCenter;        // VR left lens center
    float[2] rightLensCenter;       // VR right lens center
    float[2] leftScreenCenter;      // VR left screen center
    float[2] rightScreenCenter;     // VR right screen center
    float[2] scale;                 // VR distortion scale
    float[2] scaleIn;               // VR distortion scale in
}         // VrStereoConfig, VR stereo rendering configuration for simulator

struct FilePathList{
    uint capacity;          // Filepaths max entries
    uint count;             // Filepaths entries count
    char **paths;                   // Filepaths entries
}           // File path list

struct AutomationEvent{
    uint frame;             // Event frame  
    uint type;              // Event type (AutomationEventType)
    int[4] params;                  // Event parameters (if required)
}        // Automation event
struct AutomationEventList{
    uint capacity;          // Events max entries (MAX_AUTOMATION_EVENTS)
    uint count;             // Events entries count
    AutomationEvent *events;        // Events entries
}    // Automation event list

///////////////////// E N U M E R A T O R S  D E F I N I T I O N S ///////////////////
enum ConfigFlags : uint (uint flag){
    FLAG_VSYNC_HINT         = 0x00000040,   // Set to try enabling V-Sync on GPU
    FLAG_FULLSCREEN_MODE    = 0x00000002,   // Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE   = 0x00000004,   // Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 0x00000008,   // Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_HIDDEN      = 0x00000080,   // Set to hide window
    FLAG_WINDOW_MINIMIZED   = 0x00000200,   // Set to minimize window (iconify)
    FLAG_WINDOW_MAXIMIZED   = 0x00000400,   // Set to maximize window (expanded to monitor)
    FLAG_WINDOW_UNFOCUSED   = 0x00000800,   // Set to window non focused
    FLAG_WINDOW_TOPMOST     = 0x00001000,   // Set to window always on top
    FLAG_WINDOW_ALWAYS_RUN  = 0x00000100,   // Set to allow windows running while minimized
    FLAG_WINDOW_TRANSPARENT = 0x00000010,   // Set to allow transparent framebuffer
    FLAG_WINDOW_HIGHDPI     = 0x00002000,   // Set to support HighDPI
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, // Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, // Set to run program in borderless windowed mode
    FLAG_MSAA_4X_HINT       = 0x00000020,   // Set to try enabling MSAA 4X
    FLAG_INTERLACED_HINT    = 0x00010000    // Set to try enabling interlaced video format (for V3D)
} 

enum TraceLogLevel : int {
    LOG_ALL,        // Display all logs
    LOG_TRACE,          // Trace logging, intended for internal use only
    LOG_DEBUG,          // Debug logging, used for internal debugging, it should be disabled on release builds
    LOG_INFO,           // Info logging, used for program execution info
    LOG_WARNING,        // Warning logging, used on recoverable failures
    LOG_ERROR,          // Error logging, used on unrecoverable failures
    LOG_FATAL,          // Fatal logging, used to abort program: exit(EXIT_FAILURE)
    LOG_NONE            // Disable logging
} 

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
enum KeyboardKey : int (int key){
    KEY_NULL            = 0,        // Key: NULL, used for no key pressed
    // Alphanumeric keys
    KEY_APOSTROPHE      = 39,       // Key: '
    KEY_COMMA           = 44,       // Key: ,
    KEY_MINUS           = 45,       // Key: -
    KEY_PERIOD          = 46,       // Key: .
    KEY_SLASH           = 47,       // Key: /
    KEY_ZERO            = 48,       // Key: 0
    KEY_ONE             = 49,       // Key: 1
    KEY_TWO             = 50,       // Key: 2
    KEY_THREE           = 51,       // Key: 3
    KEY_FOUR            = 52,       // Key: 4
    KEY_FIVE            = 53,       // Key: 5
    KEY_SIX             = 54,       // Key: 6
    KEY_SEVEN           = 55,       // Key: 7
    KEY_EIGHT           = 56,       // Key: 8
    KEY_NINE            = 57,       // Key: 9
    KEY_SEMICOLON       = 59,       // Key: ;
    KEY_EQUAL           = 61,       // Key: =
    KEY_A               = 65,       // Key: A | a
    KEY_B               = 66,       // Key: B | b
    KEY_C               = 67,       // Key: C | c
    KEY_D               = 68,       // Key: D | d
    KEY_E               = 69,       // Key: E | e
    KEY_F               = 70,       // Key: F | f
    KEY_G               = 71,       // Key: G | g
    KEY_H               = 72,       // Key: H | h
    KEY_I               = 73,       // Key: I | i
    KEY_J               = 74,       // Key: J | j
    KEY_K               = 75,       // Key: K | k
    KEY_L               = 76,       // Key: L | l
    KEY_M               = 77,       // Key: M | m
    KEY_N               = 78,       // Key: N | n
    KEY_O               = 79,       // Key: O | o
    KEY_P               = 80,       // Key: P | p
    KEY_Q               = 81,       // Key: Q | q
    KEY_R               = 82,       // Key: R | r
    KEY_S               = 83,       // Key: S | s
    KEY_T               = 84,       // Key: T | t
    KEY_U               = 85,       // Key: U | u
    KEY_V               = 86,       // Key: V | v
    KEY_W               = 87,       // Key: W | w
    KEY_X               = 88,       // Key: X | x
    KEY_Y               = 89,       // Key: Y | y
    KEY_Z               = 90,       // Key: Z | z
    KEY_LEFT_BRACKET    = 91,       // Key: [
    KEY_BACKSLASH       = 92,       // Key: '\'
    KEY_RIGHT_BRACKET   = 93,       // Key: ]
    KEY_GRAVE           = 96,       // Key: `
    // Function keys
    KEY_SPACE           = 32,       // Key: Space
    KEY_ESCAPE          = 256,      // Key: Esc
    KEY_ENTER           = 257,      // Key: Enter
    KEY_TAB             = 258,      // Key: Tab
    KEY_BACKSPACE       = 259,      // Key: Backspace
    KEY_INSERT          = 260,      // Key: Ins
    KEY_DELETE          = 261,      // Key: Del
    KEY_RIGHT           = 262,      // Key: Cursor right
    KEY_LEFT            = 263,      // Key: Cursor left
    KEY_DOWN            = 264,      // Key: Cursor down
    KEY_UP              = 265,      // Key: Cursor up
    KEY_PAGE_UP         = 266,      // Key: Page up
    KEY_PAGE_DOWN       = 267,      // Key: Page down
    KEY_HOME            = 268,      // Key: Home
    KEY_END             = 269,      // Key: End
    KEY_CAPS_LOCK       = 280,      // Key: Caps lock
    KEY_SCROLL_LOCK     = 281,      // Key: Scroll down
    KEY_NUM_LOCK        = 282,      // Key: Num lock
    KEY_PRINT_SCREEN    = 283,      // Key: Print screen
    KEY_PAUSE           = 284,      // Key: Pause
    KEY_F1              = 290,      // Key: F1
    KEY_F2              = 291,      // Key: F2
    KEY_F3              = 292,      // Key: F3
    KEY_F4              = 293,      // Key: F4
    KEY_F5              = 294,      // Key: F5
    KEY_F6              = 295,      // Key: F6
    KEY_F7              = 296,      // Key: F7
    KEY_F8              = 297,      // Key: F8
    KEY_F9              = 298,      // Key: F9
    KEY_F10             = 299,      // Key: F10
    KEY_F11             = 300,      // Key: F11
    KEY_F12             = 301,      // Key: F12
    KEY_LEFT_SHIFT      = 340,      // Key: Shift left
    KEY_LEFT_CONTROL    = 341,      // Key: Control left
    KEY_LEFT_ALT        = 342,      // Key: Alt left
    KEY_LEFT_SUPER      = 343,      // Key: Super left
    KEY_RIGHT_SHIFT     = 344,      // Key: Shift right
    KEY_RIGHT_CONTROL   = 345,      // Key: Control right
    KEY_RIGHT_ALT       = 346,      // Key: Alt right
    KEY_RIGHT_SUPER     = 347,      // Key: Super right
    KEY_KB_MENU         = 348,      // Key: KB menu
    // Keypad keys
    KEY_KP_0            = 320,      // Key: Keypad 0
    KEY_KP_1            = 321,      // Key: Keypad 1
    KEY_KP_2            = 322,      // Key: Keypad 2
    KEY_KP_3            = 323,      // Key: Keypad 3
    KEY_KP_4            = 324,      // Key: Keypad 4
    KEY_KP_5            = 325,      // Key: Keypad 5
    KEY_KP_6            = 326,      // Key: Keypad 6
    KEY_KP_7            = 327,      // Key: Keypad 7
    KEY_KP_8            = 328,      // Key: Keypad 8
    KEY_KP_9            = 329,      // Key: Keypad 9
    KEY_KP_DECIMAL      = 330,      // Key: Keypad .
    KEY_KP_DIVIDE       = 331,      // Key: Keypad /
    KEY_KP_MULTIPLY     = 332,      // Key: Keypad *
    KEY_KP_SUBTRACT     = 333,      // Key: Keypad -
    KEY_KP_ADD          = 334,      // Key: Keypad +
    KEY_KP_ENTER        = 335,      // Key: Keypad Enter
    KEY_KP_EQUAL        = 336,      // Key: Keypad =
    // Android key buttons
    KEY_BACK            = 4,        // Key: Android back button
    KEY_MENU            = 5,        // Key: Android menu button
    KEY_VOLUME_UP       = 24,       // Key: Android volume up button
    KEY_VOLUME_DOWN     = 25        // Key: Android volume down button
}

enum MouseButton : int {
    MOUSE_BUTTON_LEFT,       // Mouse button left
    MOUSE_BUTTON_RIGHT,       // Mouse button right
    MOUSE_BUTTON_MIDDLE,       // Mouse button middle (pressed wheel)
    MOUSE_BUTTON_SIDE,       // Mouse button side (advanced mouse device)
    MOUSE_BUTTON_EXTRA,       // Mouse button extra (advanced mouse device)
    MOUSE_BUTTON_FORWARD,       // Mouse button forward (advanced mouse device)
    MOUSE_BUTTON_BACK,       // Mouse button back (advanced mouse device)
}


const MouseButton MOUSE_LEFT_BUTTON   = MouseButton.MOUSE_BUTTON_LEFT;
const MouseButton MOUSE_RIGHT_BUTTON  = MouseButton.MOUSE_BUTTON_RIGHT;
const MouseButton MOUSE_MIDDLE_BUTTON = MouseButton.MOUSE_BUTTON_MIDDLE;

enum MouseCursor : int {
    MOUSE_CURSOR_DEFAULT,     // Default pointer shape
    MOUSE_CURSOR_ARROW,     // Arrow shape
    MOUSE_CURSOR_IBEAM,     // Text writing cursor shape
    MOUSE_CURSOR_CROSSHAIR,     // Cross shape
    MOUSE_CURSOR_POINTING_HAND,     // Pointing hand cursor
    MOUSE_CURSOR_RESIZE_EW,     // Horizontal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NS,     // Vertical resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NWSE,     // Top-left to bottom-right diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NESW,     // The top-right to bottom-left diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_ALL,     // The omnidirectional resize/move cursor shape
    MOUSE_CURSOR_NOT_ALLOWED        // The operation-not-allowed shape
}

enum GamepadButton : int{
    GAMEPAD_BUTTON_UNKNOWN,         // Unknown button, just for error checking
    GAMEPAD_BUTTON_LEFT_FACE_UP,        // Gamepad left DPAD up button
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT,     // Gamepad left DPAD right button
    GAMEPAD_BUTTON_LEFT_FACE_DOWN,      // Gamepad left DPAD down button
    GAMEPAD_BUTTON_LEFT_FACE_LEFT,      // Gamepad left DPAD left button
    GAMEPAD_BUTTON_RIGHT_FACE_UP,       // Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT,    // Gamepad right button right (i.e. PS3: Circle, Xbox: B)
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN,     // Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT,     // Gamepad right button left (i.e. PS3: Square, Xbox: X)
    GAMEPAD_BUTTON_LEFT_TRIGGER_1,      // Gamepad top/back trigger left (first), it could be a trailing button
    GAMEPAD_BUTTON_LEFT_TRIGGER_2,      // Gamepad top/back trigger left (second), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1,     // Gamepad top/back trigger right (first), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2,     // Gamepad top/back trigger right (second), it could be a trailing button
    GAMEPAD_BUTTON_MIDDLE_LEFT,         // Gamepad center buttons, left one (i.e. PS3: Select)
    GAMEPAD_BUTTON_MIDDLE,              // Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    GAMEPAD_BUTTON_MIDDLE_RIGHT,        // Gamepad center buttons, right one (i.e. PS3: Start)
    GAMEPAD_BUTTON_LEFT_THUMB,          // Gamepad joystick pressed button left
    GAMEPAD_BUTTON_RIGHT_THUMB          // Gamepad joystick pressed button right
}

enum GamepadAxis{
    GAMEPAD_AXIS_LEFT_X,     // Gamepad left stick X axis
    GAMEPAD_AXIS_LEFT_Y,     // Gamepad left stick Y axis
    GAMEPAD_AXIS_RIGHT_X,     // Gamepad right stick X axis
    GAMEPAD_AXIS_RIGHT_Y,     // Gamepad right stick Y axis
    GAMEPAD_AXIS_LEFT_TRIGGER ,     // Gamepad back trigger left, pressure level: [1..-1]
    GAMEPAD_AXIS_RIGHT_TRIGGER      // Gamepad back trigger right, pressure level: [1..-1]
}

enum MaterialMapIndex{
    MATERIAL_MAP_ALBEDO,        // Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    MATERIAL_MAP_METALNESS,         // Metalness material (same as: MATERIAL_MAP_SPECULAR)
    MATERIAL_MAP_NORMAL,            // Normal material
    MATERIAL_MAP_ROUGHNESS,         // Roughness material
    MATERIAL_MAP_OCCLUSION,         // Ambient occlusion material
    MATERIAL_MAP_EMISSION,          // Emission material
    MATERIAL_MAP_HEIGHT,            // Heightmap material
    MATERIAL_MAP_CUBEMAP,           // Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_IRRADIANCE,        // Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_PREFILTER,         // Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_BRDF               // Brdf material
}

const MaterialMapIndex MATERIAL_MAP_DIFFUSE  = MaterialMapIndex.MATERIAL_MAP_ALBEDO;
const MaterialMapIndex MATERIAL_MAP_SPECULAR = MaterialMapIndex.MATERIAL_MAP_METALNESS;

enum ShaderLocationIndex : int {
    SHADER_LOC_VERTEX_POSITION, // Shader location: vertex attribute: position
    SHADER_LOC_VERTEX_TEXCOORD01,   // Shader location: vertex attribute: texcoord01
    SHADER_LOC_VERTEX_TEXCOORD02,   // Shader location: vertex attribute: texcoord02
    SHADER_LOC_VERTEX_NORMAL,       // Shader location: vertex attribute: normal
    SHADER_LOC_VERTEX_TANGENT,      // Shader location: vertex attribute: tangent
    SHADER_LOC_VERTEX_COLOR,        // Shader location: vertex attribute: color
    SHADER_LOC_MATRIX_MVP,          // Shader location: matrix uniform: model-view-projection
    SHADER_LOC_MATRIX_VIEW,         // Shader location: matrix uniform: view (camera transform)
    SHADER_LOC_MATRIX_PROJECTION,   // Shader location: matrix uniform: projection
    SHADER_LOC_MATRIX_MODEL,        // Shader location: matrix uniform: model (transform)
    SHADER_LOC_MATRIX_NORMAL,       // Shader location: matrix uniform: normal
    SHADER_LOC_VECTOR_VIEW,         // Shader location: vector uniform: view
    SHADER_LOC_COLOR_DIFFUSE,       // Shader location: vector uniform: diffuse color
    SHADER_LOC_COLOR_SPECULAR,      // Shader location: vector uniform: specular color
    SHADER_LOC_COLOR_AMBIENT,       // Shader location: vector uniform: ambient color
    SHADER_LOC_MAP_ALBEDO,          // Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
    SHADER_LOC_MAP_METALNESS,       // Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
    SHADER_LOC_MAP_NORMAL,          // Shader location: sampler2d texture: normal
    SHADER_LOC_MAP_ROUGHNESS,       // Shader location: sampler2d texture: roughness
    SHADER_LOC_MAP_OCCLUSION,       // Shader location: sampler2d texture: occlusion
    SHADER_LOC_MAP_EMISSION,        // Shader location: sampler2d texture: emission
    SHADER_LOC_MAP_HEIGHT,          // Shader location: sampler2d texture: height
    SHADER_LOC_MAP_CUBEMAP,         // Shader location: samplerCube texture: cubemap
    SHADER_LOC_MAP_IRRADIANCE,      // Shader location: samplerCube texture: irradiance
    SHADER_LOC_MAP_PREFILTER,       // Shader location: samplerCube texture: prefilter
    SHADER_LOC_MAP_BRDF             // Shader location: sampler2d texture: brdf
}

const ShaderLocationIndex SHADER_LOC_MAP_DIFFUSE    = ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO;
const ShaderLocationIndex SHADER_LOC_MAP_SPECULAR   = ShaderLocationIndex.SHADER_LOC_MAP_METALNESS;

enum ShaderUniformDataType : int {
    SHADER_UNIFORM_FLOAT,       // Shader uniform type: float
    SHADER_UNIFORM_VEC2,            // Shader uniform type: vec2 (2 float)
    SHADER_UNIFORM_VEC3,            // Shader uniform type: vec3 (3 float)
    SHADER_UNIFORM_VEC4,            // Shader uniform type: vec4 (4 float)
    SHADER_UNIFORM_INT,             // Shader uniform type: int
    SHADER_UNIFORM_IVEC2,           // Shader uniform type: ivec2 (2 int)
    SHADER_UNIFORM_IVEC3,           // Shader uniform type: ivec3 (3 int)
    SHADER_UNIFORM_IVEC4,           // Shader uniform type: ivec4 (4 int)
    SHADER_UNIFORM_SAMPLER2D        // Shader uniform type: sampler2d
} 

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
enum PixelFormat : int (uint format){
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 0,      // 8 bit per pixel (no alpha)
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,     // 8*2 bpp (2 channels)
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,         // 16 bpp
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,         // 24 bpp
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,       // 16 bpp (1 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,       // 16 bpp (4 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,       // 32 bpp
    PIXELFORMAT_UNCOMPRESSED_R32 = 8,            // 32 bpp (1 channel - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,      // 32*3 bpp (3 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,  // 32*4 bpp (4 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R16 = 11,           // 16 bpp (1 channel - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16 = 12,     // 16*3 bpp (3 channels - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16 = 13,  // 16*4 bpp (4 channels - half float)
    PIXELFORMAT_COMPRESSED_DXT1_RGB = 14,        // 4 bpp (no alpha)
    PIXELFORMAT_COMPRESSED_DXT1_RGBA = 15,       // 4 bpp (1 bit alpha)
    PIXELFORMAT_COMPRESSED_DXT3_RGBA = 16,       // 8 bpp
    PIXELFORMAT_COMPRESSED_DXT5_RGBA = 17,       // 8 bpp
    PIXELFORMAT_COMPRESSED_ETC1_RGB = 18,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_RGB = 19,        // 4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 20,   // 8 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGB = 21,        // 4 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGBA = 22,       // 4 bpp
    PIXELFORMAT_COMPRESSED_ASTC_4X4_RGBA = 23,   // 8 bpp
    PIXELFORMAT_COMPRESSED_ASTC_8X8_RGBA = 24    // 2 bpp
}
// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
enum TextureFilter : int {
    TEXTURE_FILTER_POINT,               // No filter, just pixel approximation
    TEXTURE_FILTER_BILINEAR,                // Linear filtering
    TEXTURE_FILTER_TRILINEAR,               // Trilinear filtering (linear with mipmaps)
    TEXTURE_FILTER_ANISOTROPIC_4X,          // Anisotropic filtering 4x
    TEXTURE_FILTER_ANISOTROPIC_8X,          // Anisotropic filtering 8x
    TEXTURE_FILTER_ANISOTROPIC_16X,         // Anisotropic filtering 16x
} 

enum TextureWrap : int {
    TEXTURE_WRAP_REPEAT,                // Repeats texture in tiled mode
    TEXTURE_WRAP_CLAMP,                     // Clamps texture to edge pixel in tiled mode
    TEXTURE_WRAP_MIRROR_REPEAT,             // Mirrors and repeats the texture in tiled mode
    TEXTURE_WRAP_MIRROR_CLAMP               // Mirrors and clamps to border the texture in tiled mode
} 

enum CubemapLayout : int {
    CUBEMAP_LAYOUT_AUTO_DETECT,         // Automatically detect layout type
    CUBEMAP_LAYOUT_LINE_VERTICAL,           // Layout is defined by a vertical line with faces
    CUBEMAP_LAYOUT_LINE_HORIZONTAL,         // Layout is defined by a horizontal line with faces
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR,     // Layout is defined by a 3x4 cross with cubemap faces
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE,     // Layout is defined by a 4x3 cross with cubemap faces
    CUBEMAP_LAYOUT_PANORAMA                 // Layout is defined by a panorama image (equirrectangular map)
} 

enum FontType : int {
    FONT_DEFAULT,               // Default font generation, anti-aliased
    FONT_BITMAP,                    // Bitmap font generation, no anti-aliasing
    FONT_SDF                        // SDF font generation, requires external shader
} 

enum BlendMode : int {
    BLEND_ALPHA,                // Blend textures considering alpha (default)
    BLEND_ADDITIVE,                 // Blend textures adding colors
    BLEND_MULTIPLIED,               // Blend textures multiplying colors
    BLEND_ADD_COLORS,               // Blend textures adding colors (alternative)
    BLEND_SUBTRACT_COLORS,          // Blend textures subtracting colors (alternative)
    BLEND_ALPHA_PREMULTIPLY,        // Blend premultiplied textures considering alpha
    BLEND_CUSTOM,                   // Blend textures using custom src/dst factors (use rlSetBlendFactors())
    BLEND_CUSTOM_SEPARATE           // Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
} 

enum Gesture : int (int gesture){
    GESTURE_NONE        = 0,        // No gesture
    GESTURE_TAP         = 1,        // Tap gesture
    GESTURE_DOUBLETAP   = 2,        // Double tap gesture
    GESTURE_HOLD        = 4,        // Hold gesture
    GESTURE_DRAG        = 8,        // Drag gesture
    GESTURE_SWIPE_RIGHT = 16,       // Swipe right gesture
    GESTURE_SWIPE_LEFT  = 32,       // Swipe left gesture
    GESTURE_SWIPE_UP    = 64,       // Swipe up gesture
    GESTURE_SWIPE_DOWN  = 128,      // Swipe down gesture
    GESTURE_PINCH_IN    = 256,      // Pinch in gesture
    GESTURE_PINCH_OUT   = 512       // Pinch out gesture
} 
enum NPatchLayout : int {
    NPATCH_NINE_PATCH,          // Npatch layout: 3x3 tiles
    NPATCH_THREE_PATCH_VERTICAL,    // Npatch layout: 1x3 tiles
    NPATCH_THREE_PATCH_HORIZONTAL   // Npatch layout: 3x1 tiles
} 

def TraceLogCallback = fn void* (TraceLogLevel logLevel, char *text);  // Logging: Redirect trace log messages
def LoadFileDataCallback = fn ichar** (char *fileName, int *dataSize);    // FileIO: Load binary data
def SaveFileDataCallback = fn bool* (char *fileName, void *data, int dataSize);   // FileIO: Save binary data
def LoadFileTextCallback = fn char** (char *fileName);            // FileIO: Load text data
def SaveFileTextCallback = fn bool* (char *fileName, char *text); // FileIO: Save text data

///////////////////// C O L O R S ////////////////////////////////////////////////////
const Color LIGHTGRAY   = { 200, 200, 200, 255 };   // Light Gray
const Color GRAY        = { 130, 130, 130, 255 };   // Gray
const Color DARKGRAY    = { 80, 80, 80, 255 };      // Dark Gray
const Color YELLOW      = { 253, 249, 0, 255 };     // Yellow
const Color GOLD        = { 255, 203, 0, 255 };     // Gold
const Color ORANGE      = { 255, 161, 0, 255 };     // Orange
const Color PINK        = { 255, 109, 194, 255 };   // Pink
const Color RED         = { 230, 41, 55, 255 };     // Red
const Color MAROON      = { 190, 33, 55, 255 };     // Maroon
const Color GREEN       = { 0, 228, 48, 255 };      // Green
const Color LIME        = { 0, 158, 47, 255 };      // Lime
const Color DARKGREEN   = { 0, 117, 44, 255 };      // Dark Green
const Color SKYBLUE     = { 102, 191, 255, 255 };   // Sky Blue
const Color BLUE        = { 0, 121, 241, 255 };     // Blue
const Color DARKBLUE    = { 0, 82, 172, 255 };      // Dark Blue
const Color PURPLE      = { 200, 122, 255, 255 };   // Purple
const Color VIOLET      = { 135, 60, 190, 255 };    // Violet
const Color DARKPURPLE  = { 112, 31, 126, 255 };    // Dark Purple
const Color BEIGE       = { 211, 176, 131, 255 };   // Beige
const Color BROWN       = { 127, 106, 79, 255 };    // Brown
const Color DARKBROWN   = { 76, 63, 47, 255 };      // Dark Brown
const Color WHITE       = { 255, 255, 255, 255 };   // White
const Color BLACK       = { 0, 0, 0, 255 };         // Black
const Color BLANK       = { 0, 0, 0, 0 };           // Blank (Transparent)
const Color MAGENTA     = { 255, 0, 255, 255 };     // Magenta
const Color RAYWHITE    = { 245, 245, 245, 255 };   // My own White (raylib logo)