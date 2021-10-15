require "../g_object-2.0/object"

module Gtk
  # A `GtkPrintContext` encapsulates context information that is required when
  # drawing pages for printing.
  #
  # This includes the cairo context and important parameters like page size
  # and resolution. It also lets you easily create [class@Pango.Layout] and
  # [class@Pango.Context] objects that match the font metrics of the cairo surface.
  #
  # `GtkPrintContext` objects get passed to the
  # [signal@Gtk.PrintOperation::begin-print],
  # [signal@Gtk.PrintOperation::end-print],
  # [signal@Gtk.PrintOperation::request-page-setup] and
  # [signal@Gtk.PrintOperation::draw-page] signals on the
  # [class@Gtk.PrintOperation] object.
  #
  # ## Using GtkPrintContext in a ::draw-page callback
  #
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
  class PrintContext < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_print_context_get_type
    end

    def create_pango_context : Pango::Context
      # gtk_print_context_create_pango_context: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_print_context_create_pango_context(self)
      Pango::Context.new(_retval, GICrystal::Transfer::Full)
    end

    def create_pango_layout : Pango::Layout
      # gtk_print_context_create_pango_layout: (Method)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_print_context_create_pango_layout(self)
      Pango::Layout.new(_retval, GICrystal::Transfer::Full)
    end

    def cairo_context : Cairo::Context
      # gtk_print_context_get_cairo_context: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_cairo_context(self)
      Cairo::Context.new(_retval, GICrystal::Transfer::None)
    end

    def dpi_x : Float64
      # gtk_print_context_get_dpi_x: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_dpi_x(self)
      _retval
    end

    def dpi_y : Float64
      # gtk_print_context_get_dpi_y: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_dpi_y(self)
      _retval
    end

    def hard_margins(top : Float64, bottom : Float64, left : Float64, right : Float64) : Bool
      # gtk_print_context_get_hard_margins: (Method)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_hard_margins(self, top, bottom, left, right)
      GICrystal.to_bool(_retval)
    end

    def height : Float64
      # gtk_print_context_get_height: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_height(self)
      _retval
    end

    def page_setup : Gtk::PageSetup
      # gtk_print_context_get_page_setup: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_page_setup(self)
      Gtk::PageSetup.new(_retval, GICrystal::Transfer::None)
    end

    def pango_fontmap : Pango::FontMap
      # gtk_print_context_get_pango_fontmap: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_pango_fontmap(self)
      Pango::FontMap.new(_retval, GICrystal::Transfer::None)
    end

    def width : Float64
      # gtk_print_context_get_width: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_print_context_get_width(self)
      _retval
    end

    def set_cairo_context(cr : Cairo::Context, dpi_x : Float64, dpi_y : Float64) : Nil
      # gtk_print_context_set_cairo_context: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_print_context_set_cairo_context(self, cr, dpi_x, dpi_y)
    end
  end
end
