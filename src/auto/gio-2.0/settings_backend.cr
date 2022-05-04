require "../g_object-2.0/object"

module Gio
  # The #GSettingsBackend interface defines a generic interface for
  # non-strictly-typed data that is stored in a hierarchy. To implement
  # an alternative storage backend for #GSettings, you need to implement
  # the #GSettingsBackend interface and then make it implement the
  # extension point %G_SETTINGS_BACKEND_EXTENSION_POINT_NAME.
  #
  # The interface defines methods for reading and writing values, a
  # method for determining if writing of certain values will fail
  # (lockdown) and a change notification mechanism.
  #
  # The semantics of the interface are very precisely defined and
  # implementations must carefully adhere to the expectations of
  # callers that are documented on each of the interface methods.
  #
  # Some of the #GSettingsBackend functions accept or return a #GTree.
  # These trees always have strings as keys and #GVariant as values.
  # g_settings_backend_create_tree() is a convenience function to create
  # suitable trees.
  #
  # The #GSettingsBackend API is exported to allow third-party
  # implementations, but does not carry the same stability guarantees
  # as the public GIO API. For this reason, you have to define the
  # C preprocessor symbol %G_SETTINGS_ENABLE_BACKEND before including
  # `gio/gsettingsbackend.h`.
  @[GObject::GeneratedWrapper]
  class SettingsBackend < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::SettingsBackendClass), class_init,
        sizeof(LibGio::SettingsBackend), instance_init, 0)
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
      LibGio.g_settings_backend_get_type
    end

    # Calculate the longest common prefix of all keys in a tree and write
    # out an array of the key names relative to that prefix and,
    # optionally, the value to store at each of those keys.
    #
    # You must free the value returned in @path, @keys and @values using
    # g_free().  You should not attempt to free or unref the contents of
    # @keys or @values.
    def self.flatten_tree(tree : GLib::Tree, path : ::String, keys : Enumerable(::String)) : Nil
      # g_settings_backend_flatten_tree: (None)
      # @path: (out) (transfer full)
      # @keys: (out) (transfer container) (array zero-terminated=1 element-type Utf8)
      # @values: (out) (transfer container) (optional) (array zero-terminated=1 element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      keys = keys.to_a.map(&.to_unsafe).to_unsafe
      # Generator::OutArgUsedInReturnPlan
      values = Pointer(Pointer(Pointer(Void))).null # Generator::ArrayArgPlan
      values = values.to_a.map { |_i| GLib::Variant.new(_i).to_unsafe }.to_unsafe

      # C call
      LibGio.g_settings_backend_flatten_tree(tree, path, keys, values)

      # Return value handling
    end

    # Returns the default #GSettingsBackend. It is possible to override
    # the default by setting the `GSETTINGS_BACKEND` environment variable
    # to the name of a settings backend.
    #
    # The user gets a reference to the backend.
    def self.default : Gio::SettingsBackend
      # g_settings_backend_get_default: (None)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_settings_backend_get_default

      # Return value handling

      Gio::SettingsBackend.new(_retval, GICrystal::Transfer::Full)
    end

    # Signals that a single key has possibly changed.  Backend
    # implementations should call this if a key has possibly changed its
    # value.
    #
    # @key must be a valid key (ie starting with a slash, not containing
    # '//', and not ending with a slash).
    #
    # The implementation must call this function during any call to
    # g_settings_backend_write(), before the call returns (except in the
    # case that no keys are actually changed and it cares to detect this
    # fact).  It may not rely on the existence of a mainloop for
    # dispatching the signal later.
    #
    # The implementation may call this function at any other time it likes
    # in response to other events (such as changes occurring outside of the
    # program).  These calls may originate from a mainloop or may originate
    # in response to any other action (including from calls to
    # g_settings_backend_write()).
    #
    # In the case that this call is in response to a call to
    # g_settings_backend_write() then @origin_tag must be set to the same
    # value that was passed to that call.
    def changed(key : ::String, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_changed: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_changed(self, key, origin_tag)

      # Return value handling
    end

    # This call is a convenience wrapper.  It gets the list of changes from
    # @tree, computes the longest common prefix and calls
    # g_settings_backend_changed().
    def changed_tree(tree : GLib::Tree, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_changed_tree: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_changed_tree(self, tree, origin_tag)

      # Return value handling
    end

    # Signals that a list of keys have possibly changed.  Backend
    # implementations should call this if keys have possibly changed their
    # values.
    #
    # @path must be a valid path (ie starting and ending with a slash and
    # not containing '//').  Each string in @items must form a valid key
    # name when @path is prefixed to it (ie: each item must not start or
    # end with '/' and must not contain '//').
    #
    # The meaning of this signal is that any of the key names resulting
    # from the contatenation of @path with each item in @items may have
    # changed.
    #
    # The same rules for when notifications must occur apply as per
    # g_settings_backend_changed().  These two calls can be used
    # interchangeably if exactly one item has changed (although in that
    # case g_settings_backend_changed() is definitely preferred).
    #
    # For efficiency reasons, the implementation should strive for @path to
    # be as long as possible (ie: the longest common prefix of all of the
    # keys that were changed) but this is not strictly required.
    def keys_changed(path : ::String, items : Enumerable(::String), origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_keys_changed: (Method)
      # @items: (array zero-terminated=1 element-type Utf8)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Generator::ArrayArgPlan
      items = items.to_a.map(&.to_unsafe).to_unsafe
      # Generator::NullableArrayPlan
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_keys_changed(self, path, items, origin_tag)

      # Return value handling
    end

    # Signals that all keys below a given path may have possibly changed.
    # Backend implementations should call this if an entire path of keys
    # have possibly changed their values.
    #
    # @path must be a valid path (ie starting and ending with a slash and
    # not containing '//').
    #
    # The meaning of this signal is that any of the key which has a name
    # starting with @path may have changed.
    #
    # The same rules for when notifications must occur apply as per
    # g_settings_backend_changed().  This call might be an appropriate
    # reasponse to a 'reset' call but implementations are also free to
    # explicitly list the keys that were affected by that call if they can
    # easily do so.
    #
    # For efficiency reasons, the implementation should strive for @path to
    # be as long as possible (ie: the longest common prefix of all of the
    # keys that were changed) but this is not strictly required.  As an
    # example, if this function is called with the path of "/" then every
    # single key in the application will be notified of a possible change.
    def path_changed(path : ::String, origin_tag : Pointer(Void)?) : Nil
      # g_settings_backend_path_changed: (Method)
      # @origin_tag: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      origin_tag = if origin_tag.nil?
                     Pointer(Void).null
                   else
                     origin_tag.to_unsafe
                   end

      # C call
      LibGio.g_settings_backend_path_changed(self, path, origin_tag)

      # Return value handling
    end

    # Signals that the writability of all keys below a given path may have
    # changed.
    #
    # Since GSettings performs no locking operations for itself, this call
    # will always be made in response to external events.
    def path_writable_changed(path : ::String) : Nil
      # g_settings_backend_path_writable_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_backend_path_writable_changed(self, path)

      # Return value handling
    end

    # Signals that the writability of a single key has possibly changed.
    #
    # Since GSettings performs no locking operations for itself, this call
    # will always be made in response to external events.
    def writable_changed(key : ::String) : Nil
      # g_settings_backend_writable_changed: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_settings_backend_writable_changed(self, key)

      # Return value handling
    end
  end
end
