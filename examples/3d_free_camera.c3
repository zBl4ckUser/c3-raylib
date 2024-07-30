import raylib;

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
fn int main()
{
    // Initialization
    //--------------------------------------------------------------------------------------
    const int SCREENWIDTH = 800;
    const int SCREENHEIGHT = 450;

    raylib::init_window(SCREENWIDTH, SCREENHEIGHT, "raylib [core] example - 3d camera free");

    // Define the camera to look into our 3d world
    Camera3D camera = { };
    camera.position = Vector3{ 10.0f, 10.0f, 10.0f }; // Camera position
    camera.target = Vector3{ 0.0f, 0.0f, 0.0f };      // Camera looking at point
    camera.up = Vector3{ 0.0f, 1.0f, 0.0f };          // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;                                // Camera field-of-view Y
    camera.projection = (int)raylib::CameraProjection.CAMERA_PERSPECTIVE;             // Camera projection type

    Vector3 cubePosition = { 0.0f, 0.0f, 0.0f };

    raylib::disable_cursor();                    // Limit cursor to relative movement inside the window

    raylib::set_target_fps(60);                   // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!raylib::window_should_close())        // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        raylib::update_camera(&camera, (int)raylib::CameraMode.CAMERA_FREE);

        if (raylib::is_key_pressed('Z')) camera.target = Vector3{ 0.0f, 0.0f, 0.0f };
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        raylib::begin_drawing();

            raylib::clear_background(raylib::RAYWHITE);

            raylib::begin_mode_3d(camera);

                raylib::draw_cube(cubePosition, 2.0f, 2.0f, 2.0f, raylib::RED);
                raylib::draw_cube_wires(cubePosition, 2.0f, 2.0f, 2.0f, raylib::MAROON);

                raylib::draw_grid(10, 1.0f);

            raylib::end_mode_3d();

            raylib::draw_rectangle( 10, 10, 320, 93, raylib::fade(raylib::SKYBLUE, 0.5f));
            raylib::draw_rectangle_lines( 10, 10, 320, 93, raylib::BLUE);

            raylib::draw_text("Free camera default controls:", 20, 20, 10, raylib::BLACK);
            raylib::draw_text("- Mouse Wheel to Zoom in-out", 40, 40, 10, raylib::DARKGRAY);
            raylib::draw_text("- Mouse Wheel Pressed to Pan", 40, 60, 10, raylib::DARKGRAY);
            raylib::draw_text("- Z to zoom to (0, 0, 0)", 40, 80, 10, raylib::DARKGRAY);

        raylib::end_drawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    defer raylib::close_window();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}