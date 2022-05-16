require "../g_object-2.0/object"
require "./style_provider"

module Gtk
  # `GtkCssProvider` is an object implementing the `GtkStyleProvider` interface
  # for CSS.
  #
  # It is able to parse CSS-like input in order to style widgets.
  #
  # An application can make GTK parse a specific CSS style sheet by calling
  # `Gtk::CssProvider#load_from_file` or
  # `Gtk::CssProvider#load_from_resource`
  # and adding the provider with `Gtk::StyleContext#add_provider` or
  # `Gtk::StyleContext#add_provider_for_display`.
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
  @[GObject::GeneratedWrapper]
  class CssProvider < GObject::Object
    include StyleProvider

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::CssProviderClass), class_init,
        sizeof(LibGtk::CssProvider), instance_init, 0)
    end

    GICrystal.define_new_method(CssProvider, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `CssProvider`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_css_provider_get_type
    end

    # Returns a newly created `GtkCssProvider`.
    def initialize
      # gtk_css_provider_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_css_provider_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Loads @data into @css_provider.
    #
    # This clears any previously loaded information.
    def load_from_data(data : Enumerable(UInt8)) : Nil
      # gtk_css_provider_load_from_data: (Method)
      # @data: (array length=length element-type UInt8)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      length = data.size # Generator::ArrayArgPlan
      data = data.to_a.to_unsafe

      # C call
      LibGtk.gtk_css_provider_load_from_data(@pointer, data, length)

      # Return value handling
    end

    def load_from_data(*data : UInt8)
      load_from_data(data)
    end

    # Loads the data contained in @file into @css_provider.
    #
    # This clears any previously loaded information.
    def load_from_file(file : Gio::File) : Nil
      # gtk_css_provider_load_from_file: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_css_provider_load_from_file(@pointer, file)

      # Return value handling
    end

    # Loads the data contained in @path into @css_provider.
    #
    # This clears any previously loaded information.
    def load_from_path(path : ::String) : Nil
      # gtk_css_provider_load_from_path: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_css_provider_load_from_path(@pointer, path)

      # Return value handling
    end

    # Loads the data contained in the resource at @resource_path into
    # the @css_provider.
    #
    # This clears any previously loaded information.
    def load_from_resource(resource_path : ::String) : Nil
      # gtk_css_provider_load_from_resource: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_css_provider_load_from_resource(@pointer, resource_path)

      # Return value handling
    end

    # Loads a theme from the usual theme paths.
    #
    # The actual process of finding the theme might change between
    # releases, but it is guaranteed that this function uses the same
    # mechanism to load the theme that GTK uses for loading its own theme.
    def load_named(name : ::String, variant : ::String?) : Nil
      # gtk_css_provider_load_named: (Method)
      # @variant: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      variant = if variant.nil?
                  Pointer(LibC::Char).null
                else
                  variant.to_unsafe
                end

      # C call
      LibGtk.gtk_css_provider_load_named(@pointer, name, variant)

      # Return value handling
    end

    # Converts the @provider into a string representation in CSS
    # format.
    #
    # Using `Gtk::CssProvider#load_from_data` with the return
    # value from this function on a new provider created with
    # `Gtk::CssProvider.new` will basically create a duplicate
    # of this @provider.
    def to_string : ::String
      # gtk_css_provider_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_css_provider_to_string(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Signals that a parsing error occurred.
    #
    # The @path, @line and @position describe the actual location of
    # the error as accurately as possible.
    #
    # Parsing errors are never fatal, so the parsing will resume after
    # the error. Errors may however cause parts of the given data or
    # even all of it to not be parsed at all. So it is a useful idea
    # to check that the parsing succeeds by connecting to this signal.
    #
    # Note that this signal may be emitted at any time as the css provider
    # may opt to defer parsing parts or all of the input to a later time
    # than when a loading function was called.
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

      def connect(handler : Proc(Gtk::CssSection, GLib::Error, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_section : Pointer(Void), lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          section = Gtk::CssSection.new(lib_section, :none)
          error = lib_error
          ::Box(Proc(Gtk::CssSection, GLib::Error, Nil)).unbox(_lib_box).call(section, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CssSection, GLib::Error, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_section : Pointer(Void), lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          section = Gtk::CssSection.new(lib_section, :none)
          error = lib_error
          ::Box(Proc(Gtk::CssSection, GLib::Error, Nil)).unbox(_lib_box).call(section, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_section : Pointer(Void), lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::CssProvider.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          section = Gtk::CssSection.new(lib_section, :none)
          error = lib_error
          ::Box(Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil)).unbox(_lib_box).call(_sender, section, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_section : Pointer(Void), lib_error : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::CssProvider.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          section = Gtk::CssSection.new(lib_section, :none)
          error = lib_error
          ::Box(Proc(Gtk::CssProvider, Gtk::CssSection, GLib::Error, Nil)).unbox(_lib_box).call(_sender, section, error)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
