require "../g_object-2.0/object"
require "./style_provider"

module Gtk
  # `GtkCssProvider` is an object implementing the `GtkStyleProvider` interface
  # for CSS.
  #
  # It is able to parse CSS-like input in order to style widgets.
  #
  # An application can make GTK parse a specific CSS style sheet by calling
  # [method@Gtk.CssProvider.load_from_file] or
  # [method@Gtk.CssProvider.load_from_resource]
  # and adding the provider with [method@Gtk.StyleContext.add_provider] or
  # [func@Gtk.StyleContext.add_provider_for_display].
  #
  # In addition, certain files will be read when GTK is initialized.
  # First, the file `$XDG_CONFIG_HOME/gtk-4.0/gtk.css` is loaded if it
  # exists. Then, GTK loads the first existing file among
  # `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
  # `$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
  # `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css` and
  # `DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
  # where `THEME` is the name of the current theme (see the
  # [property@Gtk.Settings:gtk-theme-name] setting), `VARIANT` is the
  # variant to load (see the
  # [property@Gtk.Settings:gtk-application-prefer-dark-theme] setting),
  # `DATADIR` is the prefix configured when GTK was compiled (unless
  # overridden by the `GTK_DATA_PREFIX` environment variable), and
  # `VERSION` is the GTK version number. If no file is found for the
  # current version, GTK tries older versions all the way back to 4.0.
  #
  # To track errors while loading CSS, connect to the
  # [signal@Gtk.CssProvider::parsing-error] signal.
  class CssProvider < GObject::Object
    include StyleProvider

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_css_provider_get_type
    end

    def initialize
      # gtk_css_provider_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_css_provider_new

      # Return value handling
      @pointer = _retval
    end

    def load_from_data(data : Enumerable(UInt8)) : Nil
      # gtk_css_provider_load_from_data: (Method)
      # @data: (array length=length element-type UInt8)
      # Returns: (transfer none)

      # Handle parameters
      length = data.size
      data = data.to_a.to_unsafe

      # C call
      LibGtk.gtk_css_provider_load_from_data(self, data, length)

      # Return value handling
    end

    def load_from_data(*data : UInt8)
      load_from_data(data)
    end

    def load_from_file(file : Gio::File) : Nil
      # gtk_css_provider_load_from_file: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_css_provider_load_from_file(self, file)

      # Return value handling
    end

    def load_from_path(path : ::String) : Nil
      # gtk_css_provider_load_from_path: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_css_provider_load_from_path(self, path)

      # Return value handling
    end

    def load_from_resource(resource_path : ::String) : Nil
      # gtk_css_provider_load_from_resource: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_css_provider_load_from_resource(self, resource_path)

      # Return value handling
    end

    def load_named(name : ::String, variant : ::String?) : Nil
      # gtk_css_provider_load_named: (Method)
      # @variant: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      variant = if variant.nil?
                  Pointer(LibC::Char).null
                else
                  variant.to_unsafe
                end

      # C call
      LibGtk.gtk_css_provider_load_named(self, name, variant)

      # Return value handling
    end

    def to_string : ::String
      # gtk_css_provider_to_string: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_css_provider_to_string(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    struct ParsingErrorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "parsing-error::#{@detail}" : "parsing-error"
      end

      def connect(&block : Proc(Gtk::CssSection, GLib::Error, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::CssSection, GLib::Error, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::CssSection, GLib::Error, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::CssSection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Error.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CssSection, GLib::Error, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CssSection, GLib::Error, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::CssSection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Error.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CssSection, GLib::Error, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CssProvider.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CssSection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Error.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::CssProvider.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::CssSection.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = GLib::Error.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(section : Gtk::CssSection, error : GLib::Error) : Nil
        LibGObject.g_signal_emit_by_name(@source, "parsing-error", section, error)
      end
    end

    def parsing_error_signal
      ParsingErrorSignal.new(self)
    end
  end
end
