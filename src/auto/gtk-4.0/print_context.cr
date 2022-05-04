require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintContext` encapsulates context information that is required when
  # drawing pages for printing.
  #
  # This includes the cairo context and important parameters like page size
  # and resolution. It also lets you easily create `Pango#Layout` and
  # `Pango#Context` objects that match the font metrics of the cairo surface.
  #
  # `GtkPrintContext` objects get passed to the
  # [signal@Gtk.PrintOperation::begin-print],
  # [signal@Gtk.PrintOperation::end-print],
  # [signal@Gtk.PrintOperation::request-page-setup] and
  # [signal@Gtk.PrintOperation::draw-page] signals on the
  # `Gtk#PrintOperation` object.
  #
  # ## Using GtkPrintContext in a ::draw-page callback
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # static void
  # draw_page (GtkPrintOperation *operation,
  #            GtkPrintContext   *context,
  #            int                page_nr)
  # {
  #   cairo_t *cr;
  #   PangoLayout *layout;
  #   PangoFontDescription *desc;
  #
  #   cr = gtk_print_context_get_cairo_context (context);
  #
  #   // Draw a red rectangle, as wide as the paper (inside the margins)
  #   cairo_set_source_rgb (cr, 1.0, 0, 0);
  #   cairo_rectangle (cr, 0, 0, gtk_print_context_get_width (context), 50);
  #
  #   cairo_fill (cr);
  #
  #   // Draw some lines
  #   cairo_move_to (cr, 20, 10);
  #   cairo_line_to (cr, 40, 20);
  #   cairo_arc (cr, 60, 60, 20, 0, M_PI);
  #   cairo_line_to (cr, 80, 20);
  #
  #   cairo_set_source_rgb (cr, 0, 0, 0);
  #   cairo_set_line_width (cr, 5);
  #   cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND);
  #   cairo_set_line_join (cr, CAIRO_LINE_JOIN_ROUND);
  #
  #   cairo_stroke (cr);
  #
  #   // Draw some text
  #   layout = gtk_print_context_create_pango_layout (context);
  #   pango_layout_set_text (layout, "Hello World! Printing is easy", -1);
  #   desc = pango_font_description_from_string ("sans 28");
  #   pango_layout_set_font_description (layout, desc);
  #   pango_font_description_free (desc);
  #
  #   cairo_move_to (cr, 30, 20);
  #   pango_cairo_layout_path (cr, layout);
  #
  #   // Font Outline
  #   cairo_set_source_rgb (cr, 0.93, 1.0, 0.47);
  #   cairo_set_line_width (cr, 0.5);
  #   cairo_stroke_preserve (cr);
  #
  #   // Font Fill
  #   cairo_set_source_rgb (cr, 0, 0.0, 1.0);
  #   cairo_fill (cr);
  #
  #   g_object_unref (layout);
  # }
  # ```
  @[GObject::GeneratedWrapper]
  class PrintContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::PrintContext), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_context_get_type
    end

    # Creates a new `PangoContext` that can be used with the
    # `GtkPrintContext`.
    def create_pango_context : Pango::Context
      # gtk_print_context_create_pango_context: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_context_create_pango_context(self)

      # Return value handling

      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new `PangoLayout` that is suitable for use
    # with the `GtkPrintContext`.
    def create_pango_layout : Pango::Layout
      # gtk_print_context_create_pango_layout: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_print_context_create_pango_layout(self)

      # Return value handling

      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    # Obtains the cairo context that is associated with the
    # `GtkPrintContext`.
    def cairo_context : Cairo::Context
      # gtk_print_context_get_cairo_context: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_cairo_context(self)

      # Return value handling

      Cairo::Context.new(_retval, GICrystal::Transfer::None)
    end

    # Obtains the horizontal resolution of the `GtkPrintContext`,
    # in dots per inch.
    def dpi_x : Float64
      # gtk_print_context_get_dpi_x: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_dpi_x(self)

      # Return value handling

      _retval
    end

    # Obtains the vertical resolution of the `GtkPrintContext`,
    # in dots per inch.
    def dpi_y : Float64
      # gtk_print_context_get_dpi_y: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_dpi_y(self)

      # Return value handling

      _retval
    end

    # Obtains the hardware printer margins of the `GtkPrintContext`,
    # in units.
    def hard_margins(top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_print_context_get_hard_margins: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_hard_margins(self, top, bottom, left, right)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Obtains the height of the `GtkPrintContext`, in pixels.
    def height : Float64
      # gtk_print_context_get_height: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_height(self)

      # Return value handling

      _retval
    end

    # Obtains the `GtkPageSetup` that determines the page
    # dimensions of the `GtkPrintContext`.
    def page_setup : Gtk::PageSetup
      # gtk_print_context_get_page_setup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_page_setup(self)

      # Return value handling

      Gtk::PageSetup.new(_retval, GICrystal::Transfer::None)
    end

    # Returns a `PangoFontMap` that is suitable for use
    # with the `GtkPrintContext`.
    def pango_fontmap : Pango::FontMap
      # gtk_print_context_get_pango_fontmap: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_pango_fontmap(self)

      # Return value handling

      Pango::FontMap.new(_retval, GICrystal::Transfer::None)
    end

    # Obtains the width of the `GtkPrintContext`, in pixels.
    def width : Float64
      # gtk_print_context_get_width: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_print_context_get_width(self)

      # Return value handling

      _retval
    end

    # Sets a new cairo context on a print context.
    #
    # This function is intended to be used when implementing
    # an internal print preview, it is not needed for printing,
    # since GTK itself creates a suitable cairo context in that
    # case.
    def set_cairo_context(cr : Cairo::Context, dpi_x : Float64, dpi_y : Float64) : Nil
      # gtk_print_context_set_cairo_context: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_print_context_set_cairo_context(self, cr, dpi_x, dpi_y)

      # Return value handling
    end
  end
end
