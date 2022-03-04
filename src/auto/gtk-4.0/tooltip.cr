require "../g_object-2.0/object"

module Gtk
  # `GtkTooltip` is an object representing a widget tooltip.
  #
  # Basic tooltips can be realized simply by using
  # [method@Gtk.Widget.set_tooltip_text] or
  # [method@Gtk.Widget.set_tooltip_markup] without
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
  #   [method@Gtk.Tooltip.set_icon]. There are functions for setting
  #   the tooltip’s markup, setting an image from a named icon, or even
  #   putting in a custom widget.
  #
  # - Return %TRUE from your ::query-tooltip handler. This causes the tooltip
  #   to be show. If you return %FALSE, it will not be shown.
  class Tooltip < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_tooltip_get_type
    end

    def custom=(custom_widget : Gtk::Widget?) : Nil
      # gtk_tooltip_set_custom: (Method)
      # @custom_widget: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      custom_widget = if custom_widget.nil?
                        Pointer(Void).null
                      else
                        custom_widget.to_unsafe
                      end

      # C call
      LibGtk.gtk_tooltip_set_custom(self, custom_widget)

      # Return value handling
    end

    def icon=(paintable : Gdk::Paintable?) : Nil
      # gtk_tooltip_set_icon: (Method)
      # @paintable: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      paintable = if paintable.nil?
                    Pointer(Void).null
                  else
                    paintable.to_unsafe
                  end

      # C call
      LibGtk.gtk_tooltip_set_icon(self, paintable)

      # Return value handling
    end

    def icon_from_gicon=(gicon : Gio::Icon?) : Nil
      # gtk_tooltip_set_icon_from_gicon: (Method)
      # @gicon: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      gicon = if gicon.nil?
                Pointer(Void).null
              else
                gicon.to_unsafe
              end

      # C call
      LibGtk.gtk_tooltip_set_icon_from_gicon(self, gicon)

      # Return value handling
    end

    def icon_from_icon_name=(icon_name : ::String?) : Nil
      # gtk_tooltip_set_icon_from_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibGtk.gtk_tooltip_set_icon_from_icon_name(self, icon_name)

      # Return value handling
    end

    def markup=(markup : ::String?) : Nil
      # gtk_tooltip_set_markup: (Method)
      # @markup: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      markup = if markup.nil?
                 Pointer(LibC::Char).null
               else
                 markup.to_unsafe
               end

      # C call
      LibGtk.gtk_tooltip_set_markup(self, markup)

      # Return value handling
    end

    def text=(text : ::String?) : Nil
      # gtk_tooltip_set_text: (Method)
      # @text: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      text = if text.nil?
               Pointer(LibC::Char).null
             else
               text.to_unsafe
             end

      # C call
      LibGtk.gtk_tooltip_set_text(self, text)

      # Return value handling
    end

    def tip_area=(rect : Gdk::Rectangle) : Nil
      # gtk_tooltip_set_tip_area: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_tooltip_set_tip_area(self, rect)

      # Return value handling
    end
  end
end
