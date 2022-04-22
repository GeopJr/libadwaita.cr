require "./event"

module Gdk
  # An event related to a key-based device.
  @[GObject::GeneratedWrapper]
  class KeyEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::KeyEvent), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_key_event_get_type
    end

    # Extracts the consumed modifiers from a key event.
    def consumed_modifiers : Gdk::ModifierType
      # gdk_key_event_get_consumed_modifiers: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_consumed_modifiers(self)

      # Return value handling

      Gdk::ModifierType.new(_retval)
    end

    # Extracts the keycode from a key event.
    def keycode : UInt32
      # gdk_key_event_get_keycode: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_keycode(self)

      # Return value handling

      _retval
    end

    # Extracts the keyval from a key event.
    def keyval : UInt32
      # gdk_key_event_get_keyval: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_keyval(self)

      # Return value handling

      _retval
    end

    # Extracts the layout from a key event.
    def layout : UInt32
      # gdk_key_event_get_layout: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_layout(self)

      # Return value handling

      _retval
    end

    # Extracts the shift level from a key event.
    def level : UInt32
      # gdk_key_event_get_level: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_level(self)

      # Return value handling

      _retval
    end

    # Gets a keyval and modifier combination that will match
    # the event.
    #
    # See `Gdk::KeyEvent#matches`.
    def match(keyval : UInt32, modifiers : Gdk::ModifierType) : Bool
      # gdk_key_event_get_match: (Method)
      # @keyval: (out) (transfer full)
      # @modifiers: (out) (transfer full)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_get_match(self, keyval, modifiers)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Extracts whether the key event is for a modifier key.
    def is_modifier : Bool
      # gdk_key_event_is_modifier: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_is_modifier(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Matches a key event against a keyval and modifiers.
    #
    # This is typically used to trigger keyboard shortcuts such as Ctrl-C.
    #
    # Partial matches are possible where the combination matches
    # if the currently active group is ignored.
    #
    # Note that we ignore Caps Lock for matching.
    def matches(keyval : UInt32, modifiers : Gdk::ModifierType) : Gdk::KeyMatch
      # gdk_key_event_matches: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_key_event_matches(self, keyval, modifiers)

      # Return value handling

      Gdk::KeyMatch.new(_retval)
    end
  end
end
