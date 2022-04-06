using Microsoft.EntityFrameworkCore.Migrations;

namespace Proyecto_movil_5B.Migrations
{
    public partial class AgregarTablas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "artesanias",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    img = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    negocio = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    telefono = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_artesanias", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "lugares",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    img = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    lugar = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    direccion = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_lugares", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "restaurantes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Img = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    restaurante = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    menu = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    direccion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    telefono = table.Column<float>(type: "real", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_restaurantes", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "artesanias");

            migrationBuilder.DropTable(
                name: "lugares");

            migrationBuilder.DropTable(
                name: "restaurantes");
        }
    }
}
