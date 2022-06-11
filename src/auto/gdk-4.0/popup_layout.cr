module Gdk
  # The `GdkPopupLayout` struct contains information that is
  # necessary position a `Gdk#Popup` relative to its parent.
  #
  # The positioning requires a negotiation with the windowing system,
  # since it depends on external constraints, such as the position of
  # the parent surface, and the screen dimensions.
  #
  # The basic ingredients are a rectangle on the parent surface,
  # and the anchor on both that rectangle and the popup. The anchors
  # specify a side or corner to place next to each other.
  #
  # ![Popup anchors](popup-anchors.png)
  #
  # For cases where placing the anchors next to each other would make
  # the popup extend offscreen, the layout includes some hints for how
  # to resolve this problem. The hints may suggest to flip the anchor
  # position to the other side, or to 'slide' the popup along a side,
  # or to resize it.
  #
  # ![Flipping popups](popup-flip.png)
  #
  # ![Sliding popups](popup-slide.png)
  #
  # These hints may be combined.
  #
  # Ultimatively, it is up to the windowing system to determine the position
  # and size of the popup. You can learn about the result by calling
  # `Gdk::Popup#position_x`, `Gdk::Popup#position_y`,
  # `Gdk::Popup#rect_anchor` and `Gdk::Popup#surface_anchor`
  # after the popup has been presented. This can be used to adjust the rendering.
  # For example, `Gtk#Popover` changes its arrow position accordingly.
  # But you have to be careful avoid changing the size of the popover, or it
  # has to be presented again.
  class PopupLayout
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(PopupLayout.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(PopupLayout.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGdk::PopupLayout)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_popup_layout_get_type
    end

    def self.new(anchor_rect : Gdk::Rectangle, rect_anchor : Gdk::Gravity, surface_anchor : Gdk::Gravity) : self
      # gdk_popup_layout_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_popup_layout_new(anchor_rect, rect_anchor, surface_anchor)

      # Return value handling

      Gdk::PopupLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def copy : Gdk::PopupLayout
      # gdk_popup_layout_copy: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_popup_layout_copy(@pointer)

      # Return value handling

      Gdk::PopupLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(other : Gdk::PopupLayout) : Bool
      # gdk_popup_layout_equal: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_layout_equal(@pointer, other)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def anchor_hints : Gdk::AnchorHints
      # gdk_popup_layout_get_anchor_hints: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_layout_get_anchor_hints(@pointer)

      # Return value handling

      Gdk::AnchorHints.new(_retval)
    end

    def anchor_rect : Gdk::Rectangle
      # gdk_popup_layout_get_anchor_rect: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_layout_get_anchor_rect(@pointer)

      # Return value handling

      Gdk::Rectangle.new(_retval, GICrystal::Transfer::None)
    end

    def offset(dx : Int32, dy : Int32) : Nil
      # gdk_popup_layout_get_offset: (Method)
      # @dx: (out) (transfer full)
      # @dy: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_get_offset(@pointer, dx, dy)

      # Return value handling
    end

    def rect_anchor : Gdk::Gravity
      # gdk_popup_layout_get_rect_anchor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_layout_get_rect_anchor(@pointer)

      # Return value handling

      Gdk::Gravity.new(_retval)
    end

    def shadow_width(left : Int32, right : Int32, top : Int32, bottom : Int32) : Nil
      # gdk_popup_layout_get_shadow_width: (Method)
      # @left: (out) (transfer full)
      # @right: (out) (transfer full)
      # @top: (out) (transfer full)
      # @bottom: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_get_shadow_width(@pointer, left, right, top, bottom)

      # Return value handling
    end

    def surface_anchor : Gdk::Gravity
      # gdk_popup_layout_get_surface_anchor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_layout_get_surface_anchor(@pointer)

      # Return value handling

      Gdk::Gravity.new(_retval)
    end

    def ref : Gdk::PopupLayout
      # gdk_popup_layout_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGdk.gdk_popup_layout_ref(@pointer)

      # Return value handling

      Gdk::PopupLayout.new(_retval, GICrystal::Transfer::Full)
    end

    def anchor_hints=(anchor_hints : Gdk::AnchorHints) : Nil
      # gdk_popup_layout_set_anchor_hints: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_anchor_hints(@pointer, anchor_hints)

      # Return value handling
    end

    def anchor_rect=(anchor_rect : Gdk::Rectangle) : Nil
      # gdk_popup_layout_set_anchor_rect: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_anchor_rect(@pointer, anchor_rect)

      # Return value handling
    end

    def set_offset(dx : Int32, dy : Int32) : Nil
      # gdk_popup_layout_set_offset: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_offset(@pointer, dx, dy)

      # Return value handling
    end

    def rect_anchor=(anchor : Gdk::Gravity) : Nil
      # gdk_popup_layout_set_rect_anchor: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_rect_anchor(@pointer, anchor)

      # Return value handling
    end

    def set_shadow_width(left : Int32, right : Int32, top : Int32, bottom : Int32) : Nil
      # gdk_popup_layout_set_shadow_width: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_shadow_width(@pointer, left, right, top, bottom)

      # Return value handling
    end

    def surface_anchor=(anchor : Gdk::Gravity) : Nil
      # gdk_popup_layout_set_surface_anchor: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_set_surface_anchor(@pointer, anchor)

      # Return value handling
    end

    def unref : Nil
      # gdk_popup_layout_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_popup_layout_unref(@pointer)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
