require "../g_object-2.0/object"

module Gtk
  # `GtkTooltip` is an object representing a widget tooltip.
  #
  # Basic tooltips can be realized simply by using
  # `Gtk::Widget#tooltip_text=` or
  # `Gtk::Widget#tooltip_markup=` without
  # any explicit tooltip object.
  #
  # When you need a tooltip with a little more fancy contents,
  # like adding an image, or you want the tooltip to have different
  # contents per `GtkTreeView` row or cell, you will have to do a
  # little more work:
  #
  # - Set the [property@Gtk.Widget:has-tooltip] property to %TRUE.
  #   This will make GTK monitor the widget for motion and related events
  #   which are needed to determine when and where to show a tooltip.
  #
  # - Connect to the [signal@Gtk.Widget::query-tooltip] signal.
  #   This signal will be emitted when a tooltip is supposed to be shown.
  #   One of the arguments passed to the signal handler is a `GtkTooltip`
  #   object. This is the object that we are about to display as a tooltip,
  #   and can be manipulated in your callback using functions like
  #   `Gtk::Tooltip#icon=`. There are functions for setting
  #   the tooltip’s markup, setting an image from a named icon, or even
  #   putting in a custom widget.
  #
  # - Return %TRUE from your ::query-tooltip handler. This causes the tooltip
  #   to be show. If you return %FALSE, it will not be shown.
  @[GObject::GeneratedWrapper]
  class Tooltip < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Tooltip, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Tooltip`.
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
      LibGtk.gtk_tooltip_get_type
    end

    # Replaces the widget packed into the tooltip with
    # @custom_widget. @custom_widget does not get destroyed when the tooltip goes
    # away.
    # By default a box with a `GtkImage` and `GtkLabel` is embedded in
    # the tooltip, which can be configured using gtk_tooltip_set_markup()
    # and gtk_tooltip_set_icon().
    def custom=(custom_widget : Gtk::Widget?) : Nil
      # gtk_tooltip_set_custom: (Method)
      # @custom_widget: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      custom_widget = if custom_widget.nil?
                        Pointer(Void).null
                      else
                        custom_widget.to_unsafe
                      end

      # C call
      LibGtk.gtk_tooltip_set_custom(@pointer, custom_widget)

      # Return value handling
    end

    # Sets the icon of the tooltip (which is in front of the text) to be
    # @paintable.  If @paintable is %NULL, the image will be hidden.
    def icon=(paintable : Gdk::Paintable?) : Nil
      # gtk_tooltip_set_icon: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      # C call
      LibGtk.gtk_tooltip_set_icon(@pointer, paintable)

      # Return value handling
    end

    # Sets the icon of the tooltip (which is in front of the text)
    # to be the icon indicated by @gicon with the size indicated
    # by @size. If @gicon is %NULL, the image will be hidden.
    def icon_from_gicon=(gicon : Gio::Icon?) : Nil
      # gtk_tooltip_set_icon_from_gicon: (Method)
      # @gicon: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      gicon = if gicon.nil?
                Pointer(Void).null
              else
                gicon.to_unsafe
              end

      # C call
      LibGtk.gtk_tooltip_set_icon_from_gicon(@pointer, gicon)

      # Return value handling
    end

    # Sets the icon of the tooltip (which is in front of the text) to be
    # the icon indicated by @icon_name with the size indicated
    # by @size.  If @icon_name is %NULL, the image will be hidden.
    def icon_from_icon_name=(icon_name : ::String?) : Nil
      # gtk_tooltip_set_icon_from_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibGtk.gtk_tooltip_set_icon_from_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the text of the tooltip to be @markup.
    #
    # The string must be marked up with Pango markup.
    # If @markup is %NULL, the label will be hidden.
    def markup=(markup : ::String?) : Nil
      # gtk_tooltip_set_markup: (Method)
      # @markup: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      # C call
      LibGtk.gtk_tooltip_set_markup(@pointer, markup)

      # Return value handling
    end

    # Sets the text of the tooltip to be @text.
    #
    # If @text is %NULL, the label will be hidden.
    # See also `Gtk::Tooltip#markup=`.
    def text=(text : ::String?) : Nil
      # gtk_tooltip_set_text: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_tooltip_set_text(@pointer, text)

      # Return value handling
    end

    # Sets the area of the widget, where the contents of this tooltip apply,
    # to be @rect (in widget coordinates).  This is especially useful for
    # properly setting tooltips on `GtkTreeView` rows and cells, `GtkIconViews`,
    # etc.
    #
    # For setting tooltips on `GtkTreeView`, please refer to the convenience
    # functions for this: gtk_tree_view_set_tooltip_row() and
    # gtk_tree_view_set_tooltip_cell().
    def tip_area=(rect : Gdk::Rectangle) : Nil
      # gtk_tooltip_set_tip_area: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_tooltip_set_tip_area(@pointer, rect)

      # Return value handling
    end
  end
end
