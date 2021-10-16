module Gio
  # The GActionMap interface is implemented by #GActionGroup
  # implementations that operate by containing a number of
  # named #GAction instances, such as #GSimpleActionGroup.
  #
  # One useful application of this interface is to map the
  # names of actions from various action groups to unique,
  # prefixed names (e.g. by prepending "app." or "win.").
  # This is the motivation for the 'Map' part of the interface
  # name.
  module ActionMap
    def add_action(action : Gio::Action) : Nil
      # g_action_map_add_action: (Method)
      # Returns: (transfer none)

      LibGio.g_action_map_add_action(self, action)
    end

    def add_action_entries(entries : Enumerable(Gio::ActionEntry), user_data : Pointer(Nil)?) : Nil
      # g_action_map_add_action_entries: (Method)
      # @entries: (array length=n_entries element-type Interface)
      # @user_data: (nullable)
      # Returns: (transfer none)

      n_entries = entries.size
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      entries = entries.to_a.map(&.to_unsafe).to_unsafe

      LibGio.g_action_map_add_action_entries(self, entries, n_entries, user_data)
    end

    def lookup_action(action_name : ::String) : Gio::Action?
      # g_action_map_lookup_action: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_action_map_lookup_action(self, action_name)
      Gio::Action__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def remove_action(action_name : ::String) : Nil
      # g_action_map_remove_action: (Method)
      # Returns: (transfer none)

      LibGio.g_action_map_remove_action(self, action_name)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class ActionMap__Impl
    include ActionMap

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_action_map_get_type
    end

    # Cast a `GObject::Object` to `ActionMap`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ActionMap")
    end

    # Cast a `GObject::Object` to `ActionMap`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
