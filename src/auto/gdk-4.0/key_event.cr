require "./event"

module Gdk
  # An event related to a key-based device.
  class KeyEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_key_event_get_type
    end

    def consumed_modifiers : Gdk::ModifierType
      # gdk_key_event_get_consumed_modifiers: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_get_consumed_modifiers(self)
      Gdk::ModifierType.from_value(_retval)
    end

    def keycode : UInt32
      # gdk_key_event_get_keycode: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_get_keycode(self)
      _retval
    end

    def keyval : UInt32
      # gdk_key_event_get_keyval: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_get_keyval(self)
      _retval
    end

    def layout : UInt32
      # gdk_key_event_get_layout: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_get_layout(self)
      _retval
    end

    def level : UInt32
      # gdk_key_event_get_level: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_get_level(self)
      _retval
    end

    def match(keyval : UInt32, modifiers : Gdk::ModifierType) : Bool
      # gdk_key_event_get_match: (Method)
      # @keyval: (out) (transfer full)
      # @modifiers: (out) (transfer full)
      # Returns: (transfer none)

      LibGObject.g_object_ref(modifiers)

      _retval = LibGdk.gdk_key_event_get_match(self, keyval, modifiers)
      GICrystal.to_bool(_retval)
    end

    def is_modifier : Bool
      # gdk_key_event_is_modifier: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_is_modifier(self)
      GICrystal.to_bool(_retval)
    end

    def matches(keyval : UInt32, modifiers : Gdk::ModifierType) : Gdk::KeyMatch
      # gdk_key_event_matches: (Method)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_key_event_matches(self, keyval, modifiers)
      Gdk::KeyMatch.from_value(_retval)
    end
  end
end
