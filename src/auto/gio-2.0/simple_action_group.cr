require "../g_object-2.0/object"
require "./action_group"

require "./action_map"

module Gio
  # #GSimpleActionGroup is a hash table filled with #GAction objects,
  # implementing the #GActionGroup and #GActionMap interfaces.
  class SimpleActionGroup < GObject::Object
    include ActionGroup
    include ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_simple_action_group_get_type
    end

    def initialize
      # g_simple_action_group_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_simple_action_group_new

      # Return value handling
      @pointer = _retval
    end

    def add_entries(entries : Enumerable(Gio::ActionEntry), user_data : Pointer(Void)?) : Nil
      # g_simple_action_group_add_entries: (Method)
      # @entries: (array length=n_entries element-type Interface)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      n_entries = entries.size
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_simple_action_group_add_entries(self, entries, n_entries, user_data)

      # Return value handling
    end

    def insert(action : Gio::Action) : Nil
      # g_simple_action_group_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_simple_action_group_insert(self, action)

      # Return value handling
    end

    def lookup(action_name : ::String) : Gio::Action
      # g_simple_action_group_lookup: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGio.g_simple_action_group_lookup(self, action_name)

      # Return value handling
      Gio::Action__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def remove(action_name : ::String) : Nil
      # g_simple_action_group_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_simple_action_group_remove(self, action_name)

      # Return value handling
    end
  end
end
