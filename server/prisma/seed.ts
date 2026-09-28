import { PrismaClient, Profile } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

async function main() {
  const passwordHash = await bcrypt.hash('123456', 10);
  await prisma.user.upsert({
    where: { login: 'theomar_rego@hotmail' },
    update: { fullName: 'Administrador MedClinic', passwordHash, profile: Profile.ADMINISTRADOR },
    create: { fullName: 'Administrador MedClinic', login: 'theomar_rego@hotmail', passwordHash, profile: Profile.ADMINISTRADOR }
  });
  console.log('Administrador padrão criado/atualizado: theomar_rego@hotmail');
}

main().finally(() => prisma.$disconnect());
