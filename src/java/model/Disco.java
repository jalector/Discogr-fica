/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Rafa Paniagua
 */
@Entity
@Table(name = "disco")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Disco.findAll", query = "SELECT d FROM Disco d")
    , @NamedQuery(name = "Disco.findById", query = "SELECT d FROM Disco d WHERE d.id = :id")
    , @NamedQuery(name = "Disco.findByTitulo", query = "SELECT d FROM Disco d WHERE d.titulo = :titulo")
    , @NamedQuery(name = "Disco.findByPrecio", query = "SELECT d FROM Disco d WHERE d.precio = :precio")
    , @NamedQuery(name = "Disco.findByImagen", query = "SELECT d FROM Disco d WHERE d.imagen = :imagen")
    , @NamedQuery(name = "Disco.findByExistencia", query = "SELECT d FROM Disco d WHERE d.existencia = :existencia")
    , @NamedQuery(name = "Disco.findByGenero", query = "SELECT d FROM Disco d WHERE d.genero = :genero")
    , @NamedQuery(name = "Disco.findByUbicacion", query = "SELECT d FROM Disco d WHERE d.ubicacion = :ubicacion")
    , @NamedQuery(name = "Disco.findByDescripcion", query = "SELECT d FROM Disco d WHERE d.descripcion = :descripcion")
    , @NamedQuery(name = "Disco.findByIdUsuarioAlta", query = "SELECT d FROM Disco d WHERE d.idUsuarioAlta = :idUsuarioAlta")
    , @NamedQuery(name = "Disco.findByFechaAlta", query = "SELECT d FROM Disco d WHERE d.fechaAlta = :fechaAlta")
    , @NamedQuery(name = "Disco.findByIdUsuarioModificacion", query = "SELECT d FROM Disco d WHERE d.idUsuarioModificacion = :idUsuarioModificacion")
    , @NamedQuery(name = "Disco.findByFechaModificacion", query = "SELECT d FROM Disco d WHERE d.fechaModificacion = :fechaModificacion")})
public class Disco implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio")
    private float precio;
    @Size(max = 100)
    @Column(name = "imagen")
    private String imagen;
    @Column(name = "existencia")
    private Integer existencia;
    @Size(max = 30)
    @Column(name = "genero")
    private String genero;
    @Size(max = 20)
    @Column(name = "ubicacion")
    private String ubicacion;
    @Size(max = 50)
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "id_usuario_alta")
    private Integer idUsuarioAlta;
    @Column(name = "fecha_alta")
    @Temporal(TemporalType.DATE)
    private Date fechaAlta;
    @Column(name = "id_usuario_modificacion")
    private Integer idUsuarioModificacion;
    @Column(name = "fecha_modificacion")
    @Temporal(TemporalType.DATE)
    private Date fechaModificacion;
    @OneToMany(mappedBy = "idDisco")
    private Collection<Detalle> detalleCollection;

    public Disco() {
    }

    public Disco(Integer id) {
        this.id = id;
    }

    public Disco(Integer id, String titulo, float precio) {
        this.id = id;
        this.titulo = titulo;
        this.precio = precio;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Integer getExistencia() {
        return existencia;
    }

    public void setExistencia(Integer existencia) {
        this.existencia = existencia;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdUsuarioAlta() {
        return idUsuarioAlta;
    }

    public void setIdUsuarioAlta(Integer idUsuarioAlta) {
        this.idUsuarioAlta = idUsuarioAlta;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public Integer getIdUsuarioModificacion() {
        return idUsuarioModificacion;
    }

    public void setIdUsuarioModificacion(Integer idUsuarioModificacion) {
        this.idUsuarioModificacion = idUsuarioModificacion;
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    @XmlTransient
    public Collection<Detalle> getDetalleCollection() {
        return detalleCollection;
    }

    public void setDetalleCollection(Collection<Detalle> detalleCollection) {
        this.detalleCollection = detalleCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Disco)) {
            return false;
        }
        Disco other = (Disco) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Disco[ id=" + id + " ]";
    }
    
}
