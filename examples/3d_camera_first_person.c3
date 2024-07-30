import raylib;

const int MAX_COLUMNS = 20;

fn int main()
{
    const int SCREEN_WIDTH = 800;
    const int SCREEN_HEIGHT = 450;

    raylib::init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 3d camera first person");

    Camera camera;
    camera.position = Vector3{ 0.0f, 2.0f, 4.0f };
    camera.target = Vector3{ 0.0f, 2.0f, 0.0f };
    camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
    camera.fovy = 60.0f;
    camera.projection = (int)raylib::CameraProjection.CAMERA_PERSPECTIVE;

    int camera_mode = (int)raylib::CameraMode.CAMERA_FIRST_PERSON;

    float[MAX_COLUMNS] heights;
    Vector3[MAX_COLUMNS] positions;
    Color[MAX_COLUMNS] colors;

    for (int i = 0; i < MAX_COLUMNS; i++)
    {
        heights[i] = (float)raylib::get_random_value(1, 12);
        positions[i] = Vector3{ (float)raylib::get_random_value(-15, 15), heights[i]/2.0f, (float)raylib::get_random_value(-15, 15) };
        colors[i] = Color{ (char)raylib::get_random_value(20, 255), (char)raylib::get_random_value(10, 55), 30, 255 };
    }

    raylib::disable_cursor();

    raylib::set_target_fps(60);

    while (!raylib::window_should_close())
    {
        if (raylib::is_key_pressed(raylib::KEY_ONE))
        {
            camera_mode = (int)raylib::CameraMode.CAMERA_FREE;
            camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
        }

        if (raylib::is_key_pressed(raylib::KEY_TWO))
        {
            camera_mode = (int)raylib::CameraMode.CAMERA_FIRST_PERSON;
            camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
        }

        if (raylib::is_key_pressed(raylib::KEY_THREE))
        {
            camera_mode = (int)raylib::CameraMode.CAMERA_THIRD_PERSON;
            camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
        }

        if (raylib::is_key_pressed(raylib::KEY_FOUR))
        {
            camera_mode = (int)raylib::CameraMode.CAMERA_ORBITAL;
            camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
        }

        if (raylib::is_key_pressed(raylib::KEY_P))
        {
            if (camera.projection == (int)raylib::CameraProjection.CAMERA_PERSPECTIVE)
            {
                camera_mode = (int)raylib::CameraMode.CAMERA_THIRD_PERSON;
                camera.position = Vector3{ 0.0f, 2.0f, -100.0f };
                camera.target = Vector3{ 0.0f, 2.0f, 0.0f };
                camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
                camera.projection = (int)raylib::CameraProjection.CAMERA_ORTHOGRAPHIC;
                camera.fovy = 20.0f;
                raylib::camera_yaw(&camera, -135 * raylib::DEG2RAD, true);
                raylib::camera_pitch(&camera, -45 * raylib::DEG2RAD, true, true, false);
            }
            else if (camera.projection == (int)raylib::CameraProjection.CAMERA_ORTHOGRAPHIC)
            {
                camera_mode = (int)raylib::CameraMode.CAMERA_THIRD_PERSON;
                camera.position = Vector3{ 0.0f, 2.0f, 10.0f };
                camera.target = Vector3{ 0.0f, 2.0f, 0.0f };
                camera.up = Vector3{ 0.0f, 1.0f, 0.0f };
                camera.projection = (int)raylib::CameraProjection.CAMERA_PERSPECTIVE;
                camera.fovy = 60.0f;
            }
        }
        raylib::update_camera(&camera, camera_mode);

        raylib::begin_drawing();

            raylib::clear_background(raylib::RAYWHITE);

            raylib::begin_mode_3d(camera);

                raylib::draw_plane(Vector3{ 0.0f, 0.0f, 0.0f }, Vector2{ 32.0f, 32.0f}, raylib::LIGHTGRAY);
                raylib::draw_cube(Vector3{ -16.0f, 2.5f, 0.0f }, 1.0f, 5.0f, 32.0f, raylib::BLUE);
                raylib::draw_cube(Vector3{ 16.0f, 2.5f, 0.0f }, 1.0f, 5.0f, 32.0f, raylib::LIME);
                raylib::draw_cube(Vector3{ 0.0f, 2.5f, 16.0f }, 32.0f, 5.0f, 1.0f, raylib::GOLD);

                for (int i = 0; i < MAX_COLUMNS; i++)
                {
                    raylib::draw_cube(positions[i], 2.0f, heights[i], 2.0f, colors[i]);
                    raylib::draw_cube_wires(positions[i], 2.0f, heights[i], 2.0f, raylib::MAROON);
                }

                if (camera_mode == (int) raylib::CameraMode.CAMERA_THIRD_PERSON)
                {
                    raylib::draw_cube(camera.target, 0.5f, 0.5f, 0.5f, raylib::PURPLE);
                    raylib::draw_cube_wires(camera.target, 0.5f, 0.5f, 0.5f, raylib::DARKPURPLE);
                }

            raylib::end_mode_3d();

            raylib::draw_rectangle(5, 5, 330, 100, raylib::fade(raylib::SKYBLUE, 0.5f));
            raylib::draw_rectangle_lines(5, 5, 330, 100, raylib::BLUE);

            raylib::draw_text("Camera controls:", 15, 15, 10, raylib::BLACK);
            raylib::draw_text("- Move keys: W, A, S, D, Space, Left-Ctrl", 15, 30, 10, raylib::BLACK);
            raylib::draw_text("- Look around: arrow keys or mouse", 15, 45, 10, raylib::BLACK);
            raylib::draw_text("- Camera mode keys: 1, 2, 3, 4", 15, 60, 10, raylib::BLACK);
            raylib::draw_text("- Zoom keys: num-plus, num-minus or mouse scroll", 15, 75, 10, raylib::BLACK);
            raylib::draw_text("- Camera projection key: P", 15, 90, 10, raylib::BLACK);

            raylib::draw_rectangle(600, 5, 195, 100, raylib::fade(raylib::SKYBLUE, 0.5f));
            raylib::draw_rectangle_lines(600, 5, 195, 100, raylib::BLUE);

            raylib::draw_text("Camera status:", 610, 15, 10, raylib::BLACK);
            raylib::draw_text(raylib::text_format("- Mode: %s", (camera_mode == (int)raylib::CameraMode.CAMERA_FREE) ? "FREE" :
                                              (camera_mode == (int)raylib::CameraMode.CAMERA_FIRST_PERSON) ? "FIRST_PERSON" :
                                              (camera_mode == (int)raylib::CameraMode.CAMERA_THIRD_PERSON) ? "THIRD_PERSON" :
                                              (camera_mode == (int)raylib::CameraMode.CAMERA_ORBITAL) ? "ORBITAL" : "CUSTOM"), 610, 30, 10, raylib::BLACK);
            raylib::draw_text(raylib::text_format("- Projection: %s", (camera.projection == (int)raylib::CameraProjection.CAMERA_PERSPECTIVE) ? "PERSPECTIVE" :
                                                    (camera.projection == (int)raylib::CameraProjection.CAMERA_ORTHOGRAPHIC) ? "ORTHOGRAPHIC" : "CUSTOM"), 610, 45, 10, raylib::BLACK);
            raylib::draw_text(raylib::text_format("- Position: (%06.3f, %06.3f, %06.3f)", camera.position.x, camera.position.y, camera.position.z), 610, 60, 10, raylib::BLACK);
            raylib::draw_text(raylib::text_format("- Target: (%06.3f, %06.3f, %06.3f)", camera.target.x, camera.target.y, camera.target.z), 610, 75, 10, raylib::BLACK);
            raylib::draw_text(raylib::text_format("- Up: (%06.3f, %06.3f, %06.3f)", camera.up.x, camera.up.y, camera.up.z), 610, 90, 10, raylib::BLACK);

        raylib::end_drawing();
    }

    defer raylib::close_window();
    return 0;
}
