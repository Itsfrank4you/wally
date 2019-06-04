public class MyApp : Gtk.Application {

    public MyApp () {
            Object (
                    application_id: "com.github.Throdoin.wally",
                    flags: ApplicationFlags.FLAGS_NONE
            );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        var layout = new Gtk.Grid ();
        layout.column_spacing = 6;
        layout.row_spacing = 6;

        var hello_button = new Gtk.Button.with_label (_("Say hello"));        
        var hello_label = new Gtk.Label (null);

        var rotate_button = new Gtk.Button.with_label (_("Rotate"));
        var rotate_label = new Gtk.Label (_("Horizontal"));
        // add first row of widgets
        layout.attach (hello_button, 0, 0, 1, 1);
        layout.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);

        // add second row of widgets
        layout.attach (rotate_button, 0, 1, 1, 1);
        layout.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

        hello_button.clicked.connect (() => {
            hello_label.label = _("Hello World");
            hello_button.sensitive = false;
        });

        rotate_button.clicked.connect (() => {
            rotate_label.angle = 90;
            rotate_label.label = _("Vertical");
            rotate_button.sensitive = false;
        });        

        main_window.default_height = 900;
        main_window.default_width = 1310;
        main_window.title = _("Wally - your wallpaper solution!");  
        main_window.add (layout);        
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}
