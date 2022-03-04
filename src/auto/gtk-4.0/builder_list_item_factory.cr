require "./list_item_factory"

module Gtk
  # `GtkBuilderListItemFactory` is a `GtkListItemFactory` that creates
  # widgets by instantiating `GtkBuilder` UI templates.
  #
  # The templates must be extending `GtkListItem`, and typically use
  # `GtkExpression`s to obtain data from the items in the model.
  #
  # Example:
  # ```xml
  #   <interface>
  #     <template class="GtkListItem">
  #       <property name="child">
  #         <object class="GtkLabel">
  #           <property name="xalign">0</property>
  #           <binding name="label">
  #             <lookup name="name" type="SettingsKey">
  #               <lookup name="item">GtkListItem</lookup>
  #             </lookup>
  #           </binding>
  #         </object>
  #       </property>
  #     </template>
  #   </interface>
  # ```
  class BuilderListItemFactory < ListItemFactory
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, bytes : GLib::Bytes? = nil, resource : ::String? = nil, scope : Gtk::BuilderScope? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if bytes
        (_names.to_unsafe + _n).value = "bytes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, bytes)
        _n += 1
      end
      if resource
        (_names.to_unsafe + _n).value = "resource".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource)
        _n += 1
      end
      if scope
        (_names.to_unsafe + _n).value = "scope".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scope)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(BuilderListItemFactory.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_builder_list_item_factory_get_type
    end

    def bytes=(value : GLib::Bytes?) : GLib::Bytes?
      unsafe_value = value

      LibGObject.g_object_set(self, "bytes", unsafe_value, Pointer(Void).null)
      value
    end

    def bytes : GLib::Bytes?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "bytes", pointerof(value), Pointer(Void).null)
      GLib::Bytes.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def resource=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "resource", unsafe_value, Pointer(Void).null)
      value
    end

    def resource : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "resource", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def scope=(value : Gtk::BuilderScope?) : Gtk::BuilderScope?
      unsafe_value = value

      LibGObject.g_object_set(self, "scope", unsafe_value, Pointer(Void).null)
      value
    end

    def scope : Gtk::BuilderScope?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "scope", pointerof(value), Pointer(Void).null)
      Gtk::BuilderScope__Impl.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def self.new_from_bytes(scope : Gtk::BuilderScope?, bytes : GLib::Bytes) : self
      # gtk_builder_list_item_factory_new_from_bytes: (Constructor)
      # @scope: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      scope = if scope.nil?
                Pointer(Void).null
              else
                scope.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_builder_list_item_factory_new_from_bytes(scope, bytes)

      # Return value handling
      Gtk::BuilderListItemFactory.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_resource(scope : Gtk::BuilderScope?, resource_path : ::String) : self
      # gtk_builder_list_item_factory_new_from_resource: (Constructor)
      # @scope: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      scope = if scope.nil?
                Pointer(Void).null
              else
                scope.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_builder_list_item_factory_new_from_resource(scope, resource_path)

      # Return value handling
      Gtk::BuilderListItemFactory.new(_retval, GICrystal::Transfer::Full)
    end

    def bytes : GLib::Bytes
      # gtk_builder_list_item_factory_get_bytes: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_builder_list_item_factory_get_bytes(self)

      # Return value handling
      GLib::Bytes.new(_retval, GICrystal::Transfer::None)
    end

    def resource : ::String?
      # gtk_builder_list_item_factory_get_resource: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_builder_list_item_factory_get_resource(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def scope : Gtk::BuilderScope?
      # gtk_builder_list_item_factory_get_scope: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_builder_list_item_factory_get_scope(self)

      # Return value handling
      Gtk::BuilderScope__Impl.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end
  end
end
